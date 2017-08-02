package main

import "fmt"

func main() {
	var c int32
	fmt.Scan(&c)
	k := c/4 + 1
	println(k)
	for ; k > 0; k-- {
		println(c/2-k*2+2, k)
	}
}
