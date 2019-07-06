/*Реализовать двухсторонний связанный список на JavaScript 
(без использования каких-либо библиотек или фреймворков) 
со следующей структорой.  

class LinkedList {
    constructor() {}
    append(data) {} 
    head() {} 
    tail() {} 
    at(index) {} 
    insertAt(index, data) {} 
    isEmpty() {} 
    clear() {} 
    deleteAt(index) {}
    reverse() {} 
    indexOf(data) {}
*/
}

class Node {
    constructor(data) {
        this.data = data;
        this.next = null;
        this.prev = null;
    }
}

class DLList {
    constructor() {
        this.begine = null;
        this.ende = null;
    }

    append(data) {
        let node = new Node(data);
        if (!this.begine) {
            this.begine = node;
            this.ende = node;
        } else {
            node.prev = this.ende;
            this.ende.next = node;
            this.ende = node;
        }
    }

    head() {
        if (this.isEmpty()) {
            return console.log("is empty");
        } else {
            return this.begine;
        }
    }

    tail() {
        if (this.isEmpty()) {
            return console.log("is empty");
        } else {
            return this.at(this.length() - 1);
        }

    }

    insertAt(index, data) {
        let current = this.begine;
        let count = 1;
        let node = new Node(data);
        if (index === 0) {
            this.begine.prev = node;
            node.next = this.begine;
            this.begine = node;
        } else {
            while (current) {
                current = current.next;
                if (current === index) {
                    node.prev = current.prev;
                    current.prev.next = node;
                    node.next = current;
                    current.prev = node;
                }
                count++;
            }
        }
    }

    deleteAt(index) {
        let current = this.begine;
        let count = 1;
        if (index === 0) {
            this.begine = null;
            this.begine = this.begine.next;
        } else {
            while (current) {
                current = current.next;
                if (current == this.ende) {
                    this.ende = this.ende.prev;
                    this.ende.next = null;
                } else if (count === index) {
                    current.prev.next = current.next;
                    current.next.prev = current.prev;
                    break;
                }
                count++;
            }
        }
    }


    reverse() {
        let current = this.begine;
        let prev = null;
        while (current) {
            let next = current.next;
            current.next = prev;
            current.prev = next;
            prev = current;
            current = next;
        }
        this.ende = this.begine;
        this.begine = prev;
    }

    length() {
        let current = this.begine;
        let count = 0;
        while (current !== null) {
            count++;
            current = current.next;
        }
        return count;
    }

    isEmpty() {
        return this.length() < 1;
    }

    indexof(data) {
        let current = this.begine;
        let count = 0;
        while (current) {
            if (current.data === data) {
                return count;
            }
            current = current.next;
            count++;
        }
        return false;
    }

    at(index) {
        let current = this.begine;
        let count = 0;
        while (current) {
            if (count === index) {
                return current.data;
            }
            current = current.next;
            count++;
        }
        return false;
    }

    clear() {
        let current = this.begine;
        let count = 0;
        while (current !== null) {
            this.deleteAt(count);
            count++;
            current = current.next;
        }
    }
}