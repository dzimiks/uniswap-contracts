// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0;

import {IQuoterV2} from '../../protocols/v3-periphery/interfaces/IQuoterV2.sol';

library QuoterV2Deployer {
    function deploy(address factory, address weth9) internal returns (IQuoterV2 quoter) {
        bytes memory args = abi.encode(factory, weth9);
        bytes memory initcode_ = abi.encodePacked(initcode(), args);

        assembly {
            quoter := create(0, add(initcode_, 32), mload(initcode_))
        }
    }

    /// @dev autogenerated - run `./script/util/create_briefcase.sh` to generate current initcode
    function initcode() internal pure returns (bytes memory) {
        return
        hex'60c06040523480156200001157600080fd5b506040516200212c3803806200212c833981016040819052620000349162000070565b6001600160601b0319606092831b8116608052911b1660a052620000a7565b80516001600160a01b03811681146200006b57600080fd5b919050565b6000806040838503121562000083578182fd5b6200008e8362000053565b91506200009e6020840162000053565b90509250929050565b60805160601c60a05160601c612051620000db60003980610321525080610577528061095d5280610b9252506120516000f3fe608060405234801561001057600080fd5b506004361061007d5760003560e01c8063c45a01551161005b578063c45a0155146100e6578063c6a5026a146100ee578063cdca175314610101578063fa461e33146101145761007d565b80632f80bb1d146100825780634aa4a4fc146100ae578063bd21704a146100c3575b600080fd5b610095610090366004611b2b565b610129565b6040516100a59493929190611eac565b60405180910390f35b6100b661031f565b6040516100a59190611def565b6100d66100d1366004611c49565b610343565b6040516100a59493929190611f54565b6100b6610575565b6100d66100fc366004611c49565b610599565b61009561010f366004611b2b565b610754565b610127610122366004611b91565b61092c565b005b6000606080600061013986610ae8565b67ffffffffffffffff8111801561014f57600080fd5b50604051908082528060200260200182016040528015610179578160200160208202803683370190505b50925061018586610ae8565b67ffffffffffffffff8111801561019b57600080fd5b506040519080825280602002602001820160405280156101c5578160200160208202803683370190505b50915060005b60008060006101d98a610b17565b92509250925060008060008061025c6040518060a001604052808873ffffffffffffffffffffffffffffffffffffffff1681526020018973ffffffffffffffffffffffffffffffffffffffff1681526020018f81526020018762ffffff168152602001600073ffffffffffffffffffffffffffffffffffffffff16815250610343565b9350935093509350828b898151811061027157fe5b602002602001019073ffffffffffffffffffffffffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff1681525050818a89815181106102b857fe5b63ffffffff90921660209283029190910190910152929b50968201966001909601958b926102e58e610b48565b156102fa576102f38e610b50565b9d5061030a565b8c9b505050505050505050610316565b505050505050506101cb565b92959194509250565b7f000000000000000000000000000000000000000000000000000000000000000081565b60208101518151606083015160009283928392839273ffffffffffffffffffffffffffffffffffffffff808216908416109284926103819290610b8b565b9050866080015173ffffffffffffffffffffffffffffffffffffffff16600014156103af5760408701516000555b60005a90508173ffffffffffffffffffffffffffffffffffffffff1663128acb0830856103df8c60400151610bc9565b6000038c6080015173ffffffffffffffffffffffffffffffffffffffff1660001461040e578c60800151610434565b8761042d5773fffd8963efd1fc6a506488495d951d5263988d25610434565b6401000276a45b8d602001518e606001518f6000015160405160200161045593929190611d89565b6040516020818303038152906040526040518663ffffffff1660e01b8152600401610484959493929190611e10565b6040805180830381600087803b15801561049d57600080fd5b505af19250505080156104eb575060408051601f3d9081017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe01682019092526104e891810190611b6e565b60015b610568573d808015610519576040519150601f19603f3d011682016040523d82523d6000602084013e61051e565b606091505b505a82039450886080015173ffffffffffffffffffffffffffffffffffffffff166000141561054c57600080555b610557818487610bfb565b97509750975097505050505061056e565b50505050505b9193509193565b7f000000000000000000000000000000000000000000000000000000000000000081565b60208101518151606083015160009283928392839273ffffffffffffffffffffffffffffffffffffffff808216908416109284926105d79290610b8b565b905060005a90508173ffffffffffffffffffffffffffffffffffffffff1663128acb0830856106098c60400151610bc9565b60808d015173ffffffffffffffffffffffffffffffffffffffff1615610633578c60800151610659565b876106525773fffd8963efd1fc6a506488495d951d5263988d25610659565b6401000276a45b8d600001518e606001518f6020015160405160200161067a93929190611d89565b6040516020818303038152906040526040518663ffffffff1660e01b81526004016106a9959493929190611e10565b6040805180830381600087803b1580156106c257600080fd5b505af1925050508015610710575060408051601f3d9081017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016820190925261070d91810190611b6e565b60015b610568573d80801561073e576040519150601f19603f3d011682016040523d82523d6000602084013e610743565b606091505b505a82039450610557818487610bfb565b6000606080600061076486610ae8565b67ffffffffffffffff8111801561077a57600080fd5b506040519080825280602002602001820160405280156107a4578160200160208202803683370190505b5092506107b086610ae8565b67ffffffffffffffff811180156107c657600080fd5b506040519080825280602002602001820160405280156107f0578160200160208202803683370190505b50915060005b60008060006108048a610b17565b9250925092506000806000806108876040518060a001604052808973ffffffffffffffffffffffffffffffffffffffff1681526020018873ffffffffffffffffffffffffffffffffffffffff1681526020018f81526020018762ffffff168152602001600073ffffffffffffffffffffffffffffffffffffffff16815250610599565b9350935093509350828b898151811061089c57fe5b602002602001019073ffffffffffffffffffffffffffffffffffffffff16908173ffffffffffffffffffffffffffffffffffffffff1681525050818a89815181106108e357fe5b63ffffffff90921660209283029190910190910152929b50968201966001909601958b926109108e610b48565b156102fa5761091e8e610b50565b9d50505050505050506107f6565b600083138061093b5750600082135b61094457600080fd5b600080600061095284610b17565b9250925092506109847f0000000000000000000000000000000000000000000000000000000000000000848484610ccf565b5060008060008089136109ca578573ffffffffffffffffffffffffffffffffffffffff168573ffffffffffffffffffffffffffffffffffffffff1610888a6000036109ff565b8473ffffffffffffffffffffffffffffffffffffffff168673ffffffffffffffffffffffffffffffffffffffff161089896000035b9250925092506000610a12878787610b8b565b90506000808273ffffffffffffffffffffffffffffffffffffffff16633850c7bd6040518163ffffffff1660e01b815260040160e06040518083038186803b158015610a5d57600080fd5b505afa158015610a71573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610a959190611c6b565b5050505050915091508515610abb57604051848152826020820152816040820152606081fd5b60005415610ad1576000548414610ad157600080fd5b604051858152826020820152816040820152606081fd5b805160177fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffec909101045b919050565b60008080610b258482610cee565b9250610b32846014610dee565b9050610b3f846017610cee565b91509193909250565b516042111590565b8051606090610b859083906017907fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe901610ede565b92915050565b6000610bc17f0000000000000000000000000000000000000000000000000000000000000000610bbc8686866110c5565b611142565b949350505050565b60007f80000000000000000000000000000000000000000000000000000000000000008210610bf757600080fd5b5090565b6000806000806000808773ffffffffffffffffffffffffffffffffffffffff16633850c7bd6040518163ffffffff1660e01b815260040160e06040518083038186803b158015610c4a57600080fd5b505afa158015610c5e573d6000803e3d6000fd5b505050506040513d601f19601f82011682018060405250810190610c829190611c6b565b50939650610c9794508d935061127892505050565b91975095509050610cbf73ffffffffffffffffffffffffffffffffffffffff89168383611339565b9350869250505093509350935093565b6000610ce585610ce08686866110c5565b611991565b95945050505050565b600081826014011015610d6257604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601260248201527f746f416464726573735f6f766572666c6f770000000000000000000000000000604482015290519081900360640190fd5b8160140183511015610dd557604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601560248201527f746f416464726573735f6f75744f66426f756e64730000000000000000000000604482015290519081900360640190fd5b5001602001516c01000000000000000000000000900490565b600081826003011015610e6257604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601160248201527f746f55696e7432345f6f766572666c6f77000000000000000000000000000000604482015290519081900360640190fd5b8160030183511015610ed557604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601460248201527f746f55696e7432345f6f75744f66426f756e6473000000000000000000000000604482015290519081900360640190fd5b50016003015190565b60608182601f011015610f5257604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152600e60248201527f736c6963655f6f766572666c6f77000000000000000000000000000000000000604482015290519081900360640190fd5b828284011015610fc357604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152600e60248201527f736c6963655f6f766572666c6f77000000000000000000000000000000000000604482015290519081900360640190fd5b8183018451101561103557604080517f08c379a000000000000000000000000000000000000000000000000000000000815260206004820152601160248201527f736c6963655f6f75744f66426f756e6473000000000000000000000000000000604482015290519081900360640190fd5b60608215801561105457604051915060008252602082016040526110bc565b6040519150601f8416801560200281840101858101878315602002848b0101015b8183101561108d578051835260209283019201611075565b5050858452601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe016604052505b50949350505050565b6110cd6119fa565b8273ffffffffffffffffffffffffffffffffffffffff168473ffffffffffffffffffffffffffffffffffffffff161115611105579192915b506040805160608101825273ffffffffffffffffffffffffffffffffffffffff948516815292909316602083015262ffffff169181019190915290565b6000816020015173ffffffffffffffffffffffffffffffffffffffff16826000015173ffffffffffffffffffffffffffffffffffffffff161061118457600080fd5b508051602080830151604093840151845173ffffffffffffffffffffffffffffffffffffffff94851681850152939091168385015262ffffff166060808401919091528351808403820181526080840185528051908301207fff0000000000000000000000000000000000000000000000000000000000000060a085015294901b7fffffffffffffffffffffffffffffffffffffffff0000000000000000000000001660a183015260b58201939093527fe34f199b19b2b4f47f68442619d555527d244f78a3297ea89325f843f87b8b5460d5808301919091528251808303909101815260f5909101909152805191012090565b60008060008351606014611318576044845110156112cb576040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016112c290611e75565b60405180910390fd5b600484019350838060200190518101906112e59190611bdf565b6040517f08c379a00000000000000000000000000000000000000000000000000000000081526004016112c29190611e62565b8380602001905181019061132c9190611d02565b9250925092509193909250565b60008060008060008060008060088b73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b15801561138d57600080fd5b505afa1580156113a1573d6000803e3d6000fd5b505050506040513d60208110156113b757600080fd5b5051600290810b908c900b816113c957fe5b0560020b901d905060006101008c73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b15801561141c57600080fd5b505afa158015611430573d6000803e3d6000fd5b505050506040513d602081101561144657600080fd5b5051600290810b908d900b8161145857fe5b0560020b8161146357fe5b079050600060088d73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b1580156114b057600080fd5b505afa1580156114c4573d6000803e3d6000fd5b505050506040513d60208110156114da57600080fd5b5051600290810b908d900b816114ec57fe5b0560020b901d905060006101008e73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b15801561153f57600080fd5b505afa158015611553573d6000803e3d6000fd5b505050506040513d602081101561156957600080fd5b5051600290810b908e900b8161157b57fe5b0560020b8161158657fe5b07905060008160ff166001901b8f73ffffffffffffffffffffffffffffffffffffffff16635339c296856040518263ffffffff1660e01b8152600401808260010b815260200191505060206040518083038186803b1580156115e757600080fd5b505afa1580156115fb573d6000803e3d6000fd5b505050506040513d602081101561161157600080fd5b5051161180156116a457508d73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b15801561166257600080fd5b505afa158015611676573d6000803e3d6000fd5b505050506040513d602081101561168c57600080fd5b5051600290810b908d900b8161169e57fe5b0760020b155b80156116b557508b60020b8d60020b135b945060008360ff166001901b8f73ffffffffffffffffffffffffffffffffffffffff16635339c296876040518263ffffffff1660e01b8152600401808260010b815260200191505060206040518083038186803b15801561171557600080fd5b505afa158015611729573d6000803e3d6000fd5b505050506040513d602081101561173f57600080fd5b5051161180156117d257508d73ffffffffffffffffffffffffffffffffffffffff1663d0c93a7c6040518163ffffffff1660e01b815260040160206040518083038186803b15801561179057600080fd5b505afa1580156117a4573d6000803e3d6000fd5b505050506040513d60208110156117ba57600080fd5b5051600290810b908e900b816117cc57fe5b0760020b155b80156117e357508b60020b8d60020b125b95508160010b8460010b128061180f57508160010b8460010b14801561180f57508060ff168360ff1611155b1561182557839950829750819850809650611832565b8199508097508398508296505b50507fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff60ff87161b9150505b8560010b8760010b13611969578560010b8760010b14156118a3577fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff60ff858103161c165b6000818c73ffffffffffffffffffffffffffffffffffffffff16635339c2968a6040518263ffffffff1660e01b8152600401808260010b815260200191505060206040518083038186803b1580156118fa57600080fd5b505afa15801561190e573d6000803e3d6000fd5b505050506040513d602081101561192457600080fd5b5051169050611932816119c1565b61ffff16989098019750506001909501947fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff61185e565b8115611976576001880397505b8215611983576001880397505b505050505050509392505050565b600061199d8383611142565b90503373ffffffffffffffffffffffffffffffffffffffff821614610b8557600080fd5b6000805b8215610b85577fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffff8301909216916001016119c5565b604080516060810182526000808252602082018190529181019190915290565b600082601f830112611a2a578081fd5b8135611a3d611a3882611faf565b611f8b565b818152846020838601011115611a51578283fd5b816020850160208301379081016020019190915292915050565b8051600281900b8114610b1257600080fd5b600060a08284031215611a8e578081fd5b60405160a0810181811067ffffffffffffffff82111715611aab57fe5b6040529050808235611abc8161201f565b81526020830135611acc8161201f565b602082015260408381013590820152606083013562ffffff81168114611af157600080fd5b6060820152611b0260808401611b0e565b60808201525092915050565b8035610b128161201f565b805161ffff81168114610b1257600080fd5b60008060408385031215611b3d578182fd5b823567ffffffffffffffff811115611b53578283fd5b611b5f85828601611a1a565b95602094909401359450505050565b60008060408385031215611b80578182fd5b505080516020909101519092909150565b600080600060608486031215611ba5578081fd5b8335925060208401359150604084013567ffffffffffffffff811115611bc9578182fd5b611bd586828701611a1a565b9150509250925092565b600060208284031215611bf0578081fd5b815167ffffffffffffffff811115611c06578182fd5b8201601f81018413611c16578182fd5b8051611c24611a3882611faf565b818152856020838501011115611c38578384fd5b610ce5826020830160208601611fef565b600060a08284031215611c5a578081fd5b611c648383611a7d565b9392505050565b600080600080600080600060e0888a031215611c85578283fd5b8751611c908161201f565b9650611c9e60208901611a6b565b9550611cac60408901611b19565b9450611cba60608901611b19565b9350611cc860808901611b19565b925060a088015160ff81168114611cdd578283fd5b60c08901519092508015158114611cf2578182fd5b8091505092959891949750929550565b600080600060608486031215611d16578081fd5b835192506020840151611d288161201f565b9150611d3660408501611a6b565b90509250925092565b60008151808452611d57816020860160208601611fef565b601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe0169290920160200192915050565b606093841b7fffffffffffffffffffffffffffffffffffffffff000000000000000000000000908116825260e89390931b7fffffff0000000000000000000000000000000000000000000000000000000000166014820152921b166017820152602b0190565b73ffffffffffffffffffffffffffffffffffffffff91909116815260200190565b600073ffffffffffffffffffffffffffffffffffffffff8088168352861515602084015285604084015280851660608401525060a06080830152611e5760a0830184611d3f565b979650505050505050565b600060208252611c646020830184611d3f565b60208082526010908201527f556e6578706563746564206572726f7200000000000000000000000000000000604082015260600190565b600060808201868352602060808185015281875180845260a0860191508289019350845b81811015611f0257845173ffffffffffffffffffffffffffffffffffffffff1683529383019391830191600101611ed0565b505084810360408601528651808252908201925081870190845b81811015611f3e57825163ffffffff1685529383019391830191600101611f1c565b5050505060609290920192909252949350505050565b93845273ffffffffffffffffffffffffffffffffffffffff92909216602084015263ffffffff166040830152606082015260800190565b60405181810167ffffffffffffffff81118282101715611fa757fe5b604052919050565b600067ffffffffffffffff821115611fc357fe5b50601f017fffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffffe01660200190565b60005b8381101561200a578181015183820152602001611ff2565b83811115612019576000848401525b50505050565b73ffffffffffffffffffffffffffffffffffffffff8116811461204157600080fd5b5056fea164736f6c6343000706000a';
    }
}
