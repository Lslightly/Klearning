func test() {
	var a int = 2;
	var b int = 3;
	if (false)
		a = 5
	else
		a = 4;
	return a + b
}

func main() {
	var c int = 4;
	var d int = 5;
	return c + d + test()
}
