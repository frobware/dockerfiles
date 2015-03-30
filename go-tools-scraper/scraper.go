package main

import (
	"fmt"
	"log"
	"strings"

	"github.com/PuerkitoBio/goquery"
)

const InstallWith string = "Install with "

// Scrape for tools.

func main() {
	doc, err := goquery.NewDocument("http://dominik.honnef.co/posts/2014/12/an_incomplete_list_of_go_tools/")

	if err != nil {
		log.Fatal(err)
	}

	doc.Find(".tool-install").Each(func(i int, s *goquery.Selection) {
		txt := s.Text()
		if strings.HasPrefix(txt, InstallWith) {
			fmt.Println(strings.Replace(txt, InstallWith, "", -1))
		}
	})
}
