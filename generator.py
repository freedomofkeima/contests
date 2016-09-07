#!/usr/bin/python

INDEX_PATH = "gh-pages-branch/index.html"


def main():
    # Open a file in write mode
    with open(INDEX_PATH, "w+") as input_file:
        # Write to file
        input_file.write("Hello World!")


if __name__ == "__main__":
    main()

