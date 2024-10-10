use crate::errors;
use crate::screens::register_contract::enter_address::EnterAddressScreen;
use crate::screens::shared::chain_id::ChainIdScreen;
use crate::screens::shared::rpc_url::RpcUrlScreen;
use crate::state_manager::STATE_MANAGER;
use crate::workflows::workflow_manager::{process_nested_workflows, Workflow, WorkflowResult};

pub struct RegisterContractWorkflow {
    current_screen: usize,
    child_workflows: Vec<Box<dyn Workflow>>,
}

impl RegisterContractWorkflow {
    pub fn new() -> Self {
        RegisterContractWorkflow {
            current_screen: 0,
            child_workflows: vec![],
        }
    }
}

impl Workflow for RegisterContractWorkflow {
    fn next_screen(&mut self, new_workflows: Option<Vec<Box<dyn Workflow>>>) -> WorkflowResult {
        match process_nested_workflows(&mut self.child_workflows, new_workflows) {
            WorkflowResult::NextScreen(screen) => return WorkflowResult::NextScreen(screen),
            WorkflowResult::Finished => {
                self.current_screen += 1;
                self.get_screen()
            }
        }
    }

    fn previous_screen(&mut self) -> WorkflowResult {
        if self.current_screen > 1 {
            self.current_screen -= 1;
        }
        return self.get_screen();
    }

    fn handle_error(&mut self, error: Box<dyn std::error::Error>) -> WorkflowResult {
        errors::log(self.current_screen.to_string());
        match self.current_screen {
            2 => {
                if error.downcast_ref::<errors::ConnectionError>().is_some() {
                    STATE_MANAGER.app_state.lock().unwrap().set_rpc_url(None);
                    return WorkflowResult::NextScreen(Box::new(RpcUrlScreen::new()));
                }
                return WorkflowResult::Finished;
            }
            _ => WorkflowResult::Finished,
        }
    }
}

impl RegisterContractWorkflow {
    fn get_screen(&self) -> WorkflowResult {
        match self.current_screen {
            1 => return WorkflowResult::NextScreen(Box::new(ChainIdScreen::new())),
            2 => return WorkflowResult::NextScreen(Box::new(RpcUrlScreen::new())),
            3 => return WorkflowResult::NextScreen(Box::new(EnterAddressScreen::new())),
            _ => return WorkflowResult::Finished,
        }
    }
}
