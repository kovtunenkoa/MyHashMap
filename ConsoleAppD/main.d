import std.stdio;
import hashnode;
import myhashmap;

void main()
{
	/*uint sizeTable = 512;

	auto hm = new MyHashMap!(string, int)(512);
    hm.setValueForKey("MyKey1", 1);
    hm.setValueForKey("MyKey2", 2);
    writeln(hm.valueForKey("MyKey1"));
    writeln(hm.valueForKey("MyKey2"));
    writeln(hm.valueForKey("MyKey3"));
	readln();
		*/
}

unittest
{
    uint sizeTable = 512;

	auto hm = new MyHashMap!(string, int)(512);
    hm.setValueForKey("MyKey1", 1);
    hm.setValueForKey("MyKey2", 2);
    assert(hm.valueForKey("MyKey1") == 1);
    assert(hm.valueForKey("MyKey2") == 2);
///    writeln(hm.valueForKey("MyKey3"));
    try
    {
		hm.valueForKey("MyKey3");
		assert(false);
    }
    catch(Exception e)
    {
		//writeln("keu not found : ", e.msg);			// Key not found…
    }  
}
