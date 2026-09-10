int[] list;
int len = 16;
int max = 100;

void setup() {
  list = new int[len];

  for(int i=0; i<len; i++) {
    list[i] = (int)random(max);
  }

  printList();

  mergeSort(0, len-1);

  printList();
}

void printList() {
  for(int i=0; i<len; i++) {
    print(list[i] + " ");
  }
  println();
}

void mergeSort(int left, int right) {
  if(left >= right) return;

  int mid = (left + right) / 2;

  mergeSort(left, mid);
  mergeSort(mid+1, right);

  merge(left, mid, right);
}

void merge(int left, int mid, int right) {
  int[] temp = new int[len];

  int i = left;
  int j = mid + 1;
  int k = left;

  while(i <= mid && j <= right) {
    if(list[i] < list[j]) {
      temp[k] = list[i];
      i++;
    } else {
      temp[k] = list[j];
      j++;
    }
    k++;
  }

  while(i <= mid) {
    temp[k] = list[i];
    i++;
    k++;
  }

  while(j <= right) {
    temp[k] = list[j];
    j++;
    k++;
  }

  for(i=left; i<=right; i++) {
    list[i] = temp[i];
  }
}

void draw() {
}
