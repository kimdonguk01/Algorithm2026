ArrayList<SortArray> lists;
SortArray list, plist;

int napTime = 100;
int len = 16;
int index = 0;
int loop = 0;

boolean autoFlag = true;
PFont f;

void setup() {
  size(900, 600);
  f = createFont("Arial", 24);
  textFont(f);
  run();
}

void draw() {
  background(200);

  list = lists.get(index);
  list.draw();

  fill(0);
  text("bubbleSort", 20, 40);
  text(
    "(" + nf(list.i0, 2) + "," + nf(list.j0, 2) + ") - "
    + index + "/" + loop
    + " napTime:" + napTime + "(a/s)",
    20, height - 20
  );

  if (autoFlag) {
    nextStep();
  }
}

void nextStep() {
  if (index == 0) {
    delay(10 * napTime);
  } else {
    delay(napTime);
  }

  if (index < loop) {
    index++;
  } else {
    index = 0;
  }
}

void keyPressed() {
  if (key == ' ') {
    autoFlag = !autoFlag;
  } else if (key == 'a') {
    if (napTime > 100) {
      napTime -= 100;
    }
  } else if (key == 's') {
    napTime += 100;
  } else if (key == 'r') {
    run();
  } else if (key == CODED) {
    autoFlag = false;

    if (keyCode == LEFT && index > 0) {
      index--;
    } else if (keyCode == RIGHT && index < loop) {
      index++;
    }
  }
}

void mousePressed() {
  autoFlag = false;

  if (mouseButton == LEFT && index > 0) {
    index--;
  } else if (mouseButton == RIGHT && index < loop) {
    index++;
  }
}

void run() {
  loop = 0;
  index = 0;

  lists = new ArrayList<SortArray>();
  lists.add(new SortArray(len, 0, -1));

  list = lists.get(0);
  list.printArray();

  bubbleSort();

  list = lists.get(loop);
  list.printArray();
}

void bubbleSort() {
  for (int j = 0; j < len - 1; j++) {
    // 각 회전의 시작 상태 저장
    plist = lists.get(loop);
    lists.add(new SortArray(len, plist.arr, j + 1, 0));
    loop++;

    for (int i = 0; i < len - j - 1; i++) {
      // 이전 배열을 복사하여 비교 단계 저장
      plist = lists.get(loop);
      list = new SortArray(len, plist.arr, j + 1, i + 1);

      // 인접한 두 값이 역순이면 교환
      if (list.arr[i] > list.arr[i + 1]) {
        swap(list.arr, i, i + 1);
      }

      lists.add(list);
      loop++;
    }
  }
}

void swap(int[] arr, int i, int j) {
  int temp = arr[j];
  arr[j] = arr[i];
  arr[i] = temp;
}

class SortArray {
  int i0, j0, len, max, w;
  int[] arr;

  SortArray(int len, int i0, int j0) {
    max = 100;
    this.i0 = i0;
    this.j0 = j0;
    this.len = len;

    arr = new int[len];
    w = (width - 4) / len;

    shuffle();
  }

  SortArray(int len, int[] arr, int i0, int j0) {
    this.i0 = i0;
    this.j0 = j0;
    this.len = len;

    this.arr = new int[len];
    w = (width - 4) / len;

    for (int i = 0; i < len; i++) {
      this.arr[i] = arr[i];
    }
  }

  void draw() {
    for (int i = 0; i < len; i++) {
      if (j0 == i) {
        fill(64);
      } else {
        fill(128);
      }

      int x = i * w + 2;
      int h = arr[i];
      int y = height - 5 * h - 60;

      rect(x, y, w, 5 * h);
    }
  }

  void shuffle() {
    for (int i = 0; i < len; i++) {
      arr[i] = (int) random(max);
    }
  }

  void printArray() {
    print("(" + nf(i0, 2) + "," + nf(j0, 2) + ")- ");

    for (int i = 0; i < len; i++) {
      print(nf(arr[i], 2) + " ");
    }

    println();
  }
}
