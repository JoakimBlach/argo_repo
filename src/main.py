import sys
import time
import logging


def main(argv):
    while 1:
        logging.info("I say hello, kindly.")
        time.sleep(10)


if __name__ == "__main__":
    main(sys.argv[1:])
