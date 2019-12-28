package main

import (
	"fmt"
	"net"
	"os"
	"strconv"
	"strings"
	"time"
)

const (
	minPort = 0
	maxPort = 65535
)

// data validation function
func validate() int {
	if port, err := strconv.Atoi(os.Args[1]); err == nil { // number check
		if port > minPort && port < maxPort {
			return port
		} // port must be between 0 and 65535
	}
	return 0
}

// port scan function
func scan(ip string, port int) {
	// port connection
	if conn, err := net.DialTimeout("tcp", fmt.Sprintf(ip+":%d", port), time.Second); err == nil {
		fmt.Println(ip, "has open port", port)
		conn.Close() // close connection
	}
}

// main function
func main() {
	start := time.Now() // start the timer
	port := validate() // checking data
	if port == 0 {
		fmt.Println("\nWrong input !!!") // if the data is not valid
	} else {
		host, _ := os.Hostname() // get name
		addrs, _ := net.LookupIP(host) // get ip
		ip := strings.Join(strings.Split(addrs[1].String(), ".")[:2], ".") // cut the last octants
		for okt3 := 0; okt3 < 256; okt3++ {
			for okt4 := 0; okt4 < 256; okt4++ {
				ip := ip + "." + fmt.Sprint(okt3) + "." + fmt.Sprint(okt4) // add loop values to ip
				go scan(ip, port) // send to scan. run in multithread
			}
		}
	}
	fmt.Println("\nRun time :", time.Since(start)) // show the program run time
}
