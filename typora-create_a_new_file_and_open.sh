#
# Create named .MD file and open it with Typora.
# Author: Ivan Suroegin
#

function typora() {
	touch $1;
	open -a typora $1;
}

