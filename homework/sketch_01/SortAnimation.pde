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

    if (keyCode == LEFT) {
      if (index > 0) {
        index--;
      }
    } else if (keyCode == RIGHT) {
      if (index < loop) {
        index++;
      }
    }
  }
}

void mousePressed() {
  autoFlag = false;

  if (mouseButton == LEFT) {
    if (index > 0) {
      index--;
    }
  } else if (mouseButton == RIGHT) {
    if (index < loop) {
      index++;
    }
  }
}

void run() {
  index = 0;
  loop = 0;

  // run() 안의 배열 생성
lists = new ArrayList<SortArray>();
lists.add(new SortArray(len, 0, -1));

  list = lists.get(0);
  list.printArray();

  bubbleSort();

  list = lists.get(loop);
  list.printArray();
}

void bubbleSort() {
  // 한 회전이 끝날 때마다 가장 큰 값이 오른쪽에 자리 잡습니다.
  for (int j = 0; j < len - 1; j++) {
    for (int i = 0; i < len - j - 1; i++) {
      // 이전 상태를 복사하여 새로운 애니메이션 단계를 만듭니다.
      plist = lists.get(loop);
// bubbleSort() 안의 상태 복사
list = new SortArray(len, plist.arr, j + 1, i + 1);
      // 왼쪽 값이 더 크면 두 값을 교환합니다.
      if (list.arr[i] > list.arr[i + 1]) {
        swap(list.arr, i, i + 1);
      }

      lists.add(list);
      loop++;
    }
  }
}

void swap(int[] arr, int i, int j) {
  int temp = arr[i];
  arr[i] = arr[j];
  arr[j] = temp;
}
