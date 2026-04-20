class DynamicArray {
    private static int[] list;
    private int size;

    public DynamicArray(int capacity) {
        list = new int[capacity];
        size = 0;
    }

    public int get(int i) {
        return list[i];
    }

    public void set(int i, int n) {
        list[i] = n;
    }

    public void pushback(int n) {
        if (size == list.length) {
            resize();
        }
        list[size] = n;
        size++;
        // System.out.println(list.length);
    }

    public int popback() {
        // System.out.println(size);
        int last = list[size - 1];
        int[] newArray = new int[list.length];
        System.arraycopy(list, 0, newArray, 0, list.length-1);
        list = newArray;
        size--;
        return last;
    }

    private void resize() {
        int[] newArray = new int[list.length * 2];
        System.arraycopy(list, 0, newArray, 0, list.length);
        list = newArray;
    }

    public int getSize() {
        return size;
    }

    public int getCapacity() {
        return list.length;
    }
}
