#!/usr/bin/python


def main():
    # Open a file in write mode
    with open("index.html", "w+") as input_file:
        # Write to file
        input_file.write("Hello World!")


if __name__ == "__main__":
    main()

