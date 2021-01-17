import 'dart:io';

class DoubleLinkedList<T> {

  Node _head, _tail;
  int _length;

  DoubleLinkedList() {
    _head = null;
    _tail = null;
    _length = 0;
  }

  ///Returns length of the DoubleLinkedList.
  int get length => _length;

  ///Returns true if there are no elements in this DoubleLinkedList.
  bool isEmpty() => _head == null;


  ///Adds [value] at the beginning of the DoubleLinkedList.
  void addFirst(T value) {
    if (isEmpty()) {
      _head = Node();
      _head.value = value;
      _tail = _head;
    } else {
      var current = Node();
      current.value = value;
      current.next = _head;
      _head.prev = current;
      _head = current;
    }
    _length++;
  }


  ///Adds [value] at the end of the DoubleLinkedList.
  void addLast(T value) {
    if (isEmpty()) {
      _head = Node();
      _head.value = value;
      _tail = _head;
    } else {
      var current = Node();
      current.value = value;
      current.prev = _tail;
      _tail.next = current;
      _tail = current;
    }
    _length++;
  }


  ///Adds [value] by the [index] of the DoubleLinkedList.
  void addOfIndex(int index, T value) {
    if (isEmpty() && index == 0) {
      addFirst(value);
    } else {
      if (!isEmpty()) {
        if (index == length) {
          addLast(value);
        } else {
          var indexNode = getOfIndex(index);
          var current = Node();
          current.value = value;
          current.next = indexNode;
          current.prev = indexNode.prev;
          indexNode.prev.next = current;
          indexNode.prev = current;
          _length++;
        }
      }
    }
  }

  ///Updates element [value]  by the [index] of the DoubleLinkedList.
  void updateAtIndex(int index,T value){
    if(isEmpty()){
      print('List is empty');
    }else{
      try {
        var current = getOfIndex(index);
        current.value = value;
      } catch (e) {
        print(e.toString());
      }
    }
  }


  ///Removes element by the [index] of the DoubleLinkedList.
  void removeAtIndex(int index) {
    if (isEmpty()) {
      print('List is empty');
    } else {
      try {
        var current = getOfIndex(index);
        if (isHeadOrTailElement(current)) {
          removeHeadOrTail(current);
        } else {
          current.prev.next = current.next;
          current.next.prev = current.prev;
          _length--;
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }


  ///Checks if a node is the first of the last element of the DoubleLinkedList.
  bool isHeadOrTailElement(Node node) {
    return node == _head || node == _tail;
  }


  ///Removes the first or the last element of the DoubleLinkedList.
  void removeHeadOrTail(Node node) {
    if (node == _head) {
      _head = _head.next;
      _head.prev = null;
    } else {
      _tail = _tail.prev;
      _tail.next = null;
    }
    _length--;
  }


  ///Returns element by the [index] of the DoubleLinkedList.
  // ignore: missing_return
  Node getOfIndex(int index) {
    if (isEmpty()) {
      print('List is empty');
    } else {
      try {
        if (index > _length || index < 0) {
          print('Error: no element with that index!');
        } else {
          var middle = _length ~/ 2;
          if (index < middle) {
            var current = _head;
            for (var i = 0; i < middle; i++) {
              if (i == index) {
                return current;
              }
              current = current.next;
            }
          } else {
            var current = _tail;
            for (var i = _length - 1; i >= middle; i--) {
              if (i == index) {
                return current;
              }
              current = current.prev;
            }
          }
        }
      } catch (e) {
        print(e.toString());
      }
    }
  }


  ///Creates and returns a DoubleLinkedList of the List.
  DoubleLinkedList transformListToLinkedList(List<T> list) {
    var linkedList = DoubleLinkedList();
    for (var i = 0; i < list.length; i++) {
      linkedList.addOfIndex(i, list[i]);
    }
    return linkedList;
  }


  ///Prints elements value of the DoubleLinkedList.
  void printLinkList() {
    if (isEmpty()) {
      print('LinkedList is empty!');
    } else {
      var current = _head;
      while (current != null) {
        stdout.write(current.value.toString() + '\t');
        current = current.next;
      }
    }
  }
}


///Class [Node] taps for the link.
///
/// It contains a link to next element [next], a link to previous element [prev]
/// and field storing value [_value] of DoubleLinkedList.
class Node<T> {
  Node next;
  Node prev;
  T _value;

  set value(T value) => _value = value;

  T get value => _value;
}
