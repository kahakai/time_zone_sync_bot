package main

import (
	"os"
	"path/filepath"
	"testing"
)

func TestRemoveContents(t *testing.T) {
	dir := "tmp"

	if err := os.Mkdir(dir, 0755); err != nil {
		t.Fatal(err)
	}

	dirs := filepath.Join(dir, "tmpdir")
	if err := os.MkdirAll(dirs, 0755); err != nil {
		t.Fatal(err)
	}

	file := filepath.Join(dir, "tmpfile")
	f, err := os.Create(file)
	if err != nil {
		t.Fatal(err)
	}
	f.Close()

	file = filepath.Join(dirs, "tmpfile")
	f, err = os.Create(file)
	if err != nil {
		t.Fatal(err)
	}
	f.Close()

	if err := RemoveContents(dir); err != nil {
		t.Fatal(err)
	}

	if err := os.RemoveAll(dir); err != nil {
		t.Fatal(err)
	}
}
