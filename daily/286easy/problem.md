# Description

Nearly everyone is familiar with the factorial operator in math. 5! yields 120 because factorial means "multiply successive terms where each are one less than the previous":

    5! -> 5 * 4 * 3 * 2 * 1 -> 120

Simple enough. 

Now let's reverse it. Could you write a function that tells us that "120" is "5!"? 

Hint: The strategy is pretty straightforward, just divide the term by successively larger terms until you get to "1" as the resultant:

    120 -> 120/2 -> 60/3 -> 20/4 -> 5/5 -> 1 => 5!

# Sample Input

You'll be given a single integer, one per line. Examples:

    120
    150

# Sample Output

Your program should report what each number is as a factorial, or "NONE" if it's not legitimately a factorial. Examples:

    120 = 5!
    150   NONE

# Challenge Input

    3628800
    479001600
    6
    18

# Challenge Output

    3628800 = 10!
    479001600 = 12!
    6 = 3!
    18  NONE
