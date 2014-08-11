module myhashmap;
import hashnode;
import std.stdio;

class MyHashMap(K, V)
{

	private:
	
	uint sizeTable;
	HashNode!(K, V)[] table;

	public : 
	this(uint sizeTable)
	{
		this.sizeTable = sizeTable; 
		this.table =  new HashNode!(K, V)[this.sizeTable];
	}
	
	~this()
	{
		for (int i=0; i< sizeTable; i++)
		{
			HashNode!(K,V)* entry = &table[i];
			while(entry !=null)
			{
				HashNode!(K,V) *prev = entry;
				entry = entry.getNext();
				destroy(prev);
			}
		}
		destroy(table);
	}

	void Print()
	{
		writeln(table);
	}


	void setValueForKey( K key, V value)
	{
		int i = 0;
		uint hashValue = hashFunction(key);
		HashNode!(K,V) *prev =null;
		HashNode!(K,V) *entry = &table[hashValue];
		//writeln("entry - ", entry, " hashValue - ", hashValue, " for key - ", key);
		while (entry != null && entry.getKey() != key)
		{
			prev = entry;
			entry = entry.getNext();
			//writeln("	prev - ", prev, " entry - ", entry, " iter - ", i++);
		}
		
		if(entry == null)
		{
			entry  = new HashNode!(K,V)(key, value);
			table[hashValue] = *entry;
			if(prev == null) // TODO make ternare operator!
			{
				table[hashValue] = *entry;
			}
			else 
			{
				prev.setNext(entry);
			}
		
		}
		else
		{
			entry.setValue(value);
		}
	}
	
	
	V valueForKey(K key)
	{
		uint hashValue = hashFunction(key);
		HashNode!(K,V) * entry = &table[hashValue];
		while (entry != null)
		{
			if(entry.getKey() == key)
			{
				return entry.getValue();
			}
			entry = entry.getNext();
		}
		return 0;
	}
	
	uint hashFunction(K key)
	{
		uint a = 378551;
		uint hash = 0;
		for(int i=0; i < key.length; i++)
			hash = hash*a + key[i];  

		return hash % sizeTable;

	}
}

