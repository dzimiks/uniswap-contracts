use crate::errors::log;

pub fn validate_address(input: String, mut cursor_position: usize) -> String {
    if input.len() > 42 && cursor_position < input.len() {
        // if the cursor is not at the end of the input, remove the new input at the cursor position if the length of the address is greater than 42
        // remove next character at cursor position
        let mut new_input = input.clone();
        new_input.remove(cursor_position - 1);
        return new_input;
    }
    let re = regex::Regex::new(r"^0x[0-9a-fA-F]{0,40}|^0|^0x$").unwrap();
    re.find(&input)
        .map(|m| m.as_str().to_string())
        .unwrap_or_else(String::new)
}

pub fn validate_number(input: String, _cursor_position: usize) -> String {
    let cleaned = input.chars().filter(|c| c.is_digit(10)).collect::<String>();
    if cleaned.is_empty() {
        return "".to_string();
    }
    cleaned
}
