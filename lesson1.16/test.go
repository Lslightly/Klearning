func test() {
	var a int = 2;
	var b int = 3;
	a = 5;
	return a + b
}

func main() {
	var c int = 4;
	var d int = 5;
	return c + d + test()
}
