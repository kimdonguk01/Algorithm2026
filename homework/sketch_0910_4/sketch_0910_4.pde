int[] list;
int len = 16;
int max = 100;

void setup() {
  list = new int[len];

  for(int i=0; i<len; i++) {
    list[i] = (int)random(max);
  }

  printList();

  quickSort(0, len-1);

  printList();
}

void printList() {
  for(int i=0; i<len; i++) {
    print(list[i] + " ");
  }
  println();
}

void quickSort(int left, int right) {
  int i = left;
  int j = right;
  int pivot = list[(left + right) / 2];

  while(i <= j) {
    while(list[i] < pivot) i++;
    while(list[j] > pivot) j--;

    if(i <= j) {
      int tmp = list[i];
      list[i] = list[j];
      list[j] = tmp;

      i++;
      j--;
    }
  }

  if(left < j)
    quickSort(left, j);

  if(i < right)
    quickSort(i, right);
}

void draw() {
}
