int[] list;
int len = 16;
int max = 100;

void setup() {
  list = new int[len];

  for(int i=0; i<len; i++) {
    list[i] = (int)random(max);
  }

  printList();

  heapSort();

  printList();
}

void printList() {
  for(int i=0; i<len; i++) {
    print(list[i] + " ");
  }
  println();
}

void heapSort() {
  int n = list.length;

  for(int i=n/2-1; i>=0; i--) {
    heapify(n, i);
  }

  for(int i=n-1; i>0; i--) {
    int tmp = list[0];
    list[0] = list[i];
    list[i] = tmp;

    heapify(i, 0);
  }
}

void heapify(int n, int i) {
  int largest = i;
  int left = 2*i + 1;
  int right = 2*i + 2;

  if(left < n && list[left] > list[largest])
    largest = left;

  if(right < n && list[right] > list[largest])
    largest = right;

  if(largest != i) {
    int tmp = list[i];
    list[i] = list[largest];
    list[largest] = tmp;

    heapify(n, largest);
  }
}

void draw() {
}
