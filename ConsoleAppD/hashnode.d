module hashnode;



struct HashNode( K,  V) 
{
	public:
	this(ref const K  key, ref const V  value) 
	{
		this.key = key;
		this.value = value;
		next = null;
	}
	K getKey() const {
		return key;
	}
	V getValue() const {
		return value;
	}
	void setValue(V value) {
		HashNode.value = value;
	}
	HashNode *getNext()  {
		return this.next;
	}
	void setNext(HashNode *next) {
		HashNode.next = next;
	}
private:
	// key-value pair
	K key;
	V value;
	HashNode *next; // next node same key
};