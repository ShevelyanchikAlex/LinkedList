import 'DoubleLinkedList.dart';

void main(List<String> arguments) {
  DoubleLinkedList doubleLinkedList = DoubleLinkedList<String>();
  print('Length of LinkedList: ${doubleLinkedList.length}\r\n');

  doubleLinkedList.addOfIndex(0, 'Minsk');
  doubleLinkedList.addOfIndex(1, 'Moscow');
  doubleLinkedList.addOfIndex(2, 'Warsaw');
  doubleLinkedList.addOfIndex(3, 'Berlin');

  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');

  print('Added Paris with index 1:');
  doubleLinkedList.addOfIndex(1, 'Paris');
  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');

  print('Added Prague with index 3:');
  doubleLinkedList.addOfIndex(3, 'Prague');
  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');

  print('Removed element with index 2:');
  doubleLinkedList.removeAtIndex(2);
  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');

  print('Removed element with index 1:');
  doubleLinkedList.removeAtIndex(1);
  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');


  print('Got value of element with index 3:\r\n ${doubleLinkedList.getOfIndex(3).value}');

  print('\r\nUpdated element with index 1:');
  doubleLinkedList.updateAtIndex(1, 'New York');
  doubleLinkedList.printLinkList();
  print('\r\nLength of LinkedList: ${doubleLinkedList.length}\r\n');
  
  var list = [1, 2, 3, 4, 5];
  var myLinkedList = DoubleLinkedList();
  myLinkedList = myLinkedList.transformListToLinkedList(list);
  print('\r\nList to LinkedList: ');
  myLinkedList.printLinkList();
}
