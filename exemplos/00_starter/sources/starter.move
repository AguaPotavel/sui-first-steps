module cuenta::frontend {
    use std::string::{utf8, String};

    #[view]
    public fun hello_sui() : String {
        utf8(b"Hello, World!")
    }
}
