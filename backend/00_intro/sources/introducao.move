module introduccion::pratica_sui {
    use std::debug::print;
    use std::string::utf8;

    fun pratica() {
        print(&utf8(b"Hello, World!"));
    }

    #[test]
    fun teste() {
        pratica();
    }
}
