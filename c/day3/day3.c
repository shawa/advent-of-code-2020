#include <stdio.h>
#include <stdint.h>
#include <stdbool.h>

// i cba allocating buffers and all that guff so lets just compile the input
// into the program!
__asm__(".const_data");
__asm__(".global _BEGIN_TREES" );

// advance the counter to the nearest 32 bit boundary
// we're damn lucky all the lines are the same length
__asm__(".balign 32" );
__asm__("_BEGIN_TREES:" );

// see you don't get this kind of validation at runtime
__asm__(".incbin \"input.txt\"" );
__asm__(".global _END_TREES" );
__asm__(".balign 1" );
__asm__("_END_TREES:" );
__asm__(".byte 0" );

extern const void BEGIN_TREES;
extern const void END_TREES;
 

// and back to nice C...

char* START = (char*) &BEGIN_TREES;
char* END = (char*) &END_TREES;

char* advance(char* ptr, int right, int down) {
  int offset = (ptr - START);

  int line_num = offset / 32;
  int position = offset % 32;

  int new_line_num = line_num + down;
   
  // wrap at 31 to skip the newline chars
  int new_position = (position + right) % 31;
  int new_offset = new_line_num * 32 + new_position;

  return START + new_offset;
}

int count_trees(int right, int down) {
  int res = 0;

  for (char *ptr = START; ptr < END; ptr = advance(ptr, right, down)) {
    res += *ptr == '#';
  }

  return res;
}

void print_interesting_debug_things() {
  printf("input starts: %p\n", START);
  printf("input end: %p\n", END);
  printf("input size: %lu\n",  END - START);
}

void part1() {
  // Starting at the top-left corner of your map and following a slope of right
  // 3 and down 1, how many trees would you encounter?
  int res = count_trees(3, 1);
  printf("Counted %d trees.\n", res);
}

void part2() {
  // What do you get if you multiply together the number of trees encountered on
  // each of the listed slopes?
  int res = count_trees(1, 1) 
          * count_trees(3, 1) 
          * count_trees(5, 1)
          * count_trees(7, 1) 
          * count_trees(1, 2);

  printf("Product of all the trees is %d.\n", res);
}

int main() {
  print_interesting_debug_things();
  printf("\n");

  printf("Part 1: ");
  part1();

  printf("Part 2: ");
  part2();

  return 0;
}
