int[] list = new int[200];

int j, max, index, tmp; 

for(int i = 0; i < list.length; i++) {
  list[i] = (int)random(1000);
}

println();

int i; 

for (i = 0; i < list.length; i++) {
  max = index = -1;

  for (j = 0; j < list.length - i - 1; j++) {
    if (max < list[j]) {
      max = list[j];
      index = j;
    }
  }

  if (index != -1) {
    tmp = list[j];     
    list[j] = max;
    list[index] = tmp;
  }
}

for (i = 0; i < list.length; i++) {
  print(list[i], " ");
}
