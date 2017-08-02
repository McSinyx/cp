package main

import "fmt"

func main() {
	var T, N int
	fmt.Scan(&T)
	for ; T > 0; T-- {
		var s string
		fmt.Scan(&N)
		for i := 9; i > 1; i-- {
			for N%i == 0 {
				N /= i
				s = fmt.Sprint(i) + s
			}
		}
		if len(s) > 0 {
			println(s)
		} else {
			println(1)
		}
	}
}
