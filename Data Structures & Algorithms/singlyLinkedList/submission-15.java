class Node {
    int value;
    Node pNext = null;

    public Node(int value) {
        this.value = value;
    }
}

class LinkedList {
    Node head;
    Node tail;

    public LinkedList() {
        tail = head;
    }

    public int get(int index) {

        Node cur = head;
        while (index != 0 && cur != null) {
            cur = cur.pNext;
            index--;
        }
        return (cur == null) ? -1 : cur.value;
    }

    public void insertHead(int val) {
        Node newNode = new Node(val);
        newNode.pNext = head;
        head = newNode;
        if (tail == null) {
            tail = head;
        }

    }

    public void insertTail(int val) {
        if (head == null) {
            insertHead(val);
            return;
        }
        Node newNode = new Node(val);
        tail.pNext = newNode;
        tail = newNode;
    }

    public boolean remove(int index) {
        Node cur = head;
        while (index != -1) {
            if (cur == null)
                return false;
            if (index == 1) {
                if (cur.pNext == null)
                    return false;
                if (tail == cur.pNext)
                    tail = cur;
                cur.pNext = cur.pNext.pNext;
                return true;
            }
            if (index == 0) {
                head = head.pNext;
                return true;
            }
            cur = cur.pNext;
            index--;
        }

        return true;
    }

    public ArrayList<Integer> getValues() {
        ArrayList<Integer> ans = new ArrayList<Integer>();
        Node cur = head;
        while (cur != null) {
            ans.add(cur.value);
            cur = cur.pNext;
        }
        return ans;
    }
}