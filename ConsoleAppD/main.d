import std.stdio;
import hashnode;
import myhashmap;

void main()
{
	
		
}
unittest
{
    uint sizeTable = 512;

	auto hm = new HashMap!(string, int)();
    hm.setValueForKey("MyKey1", 1);
    hm.setValueForKey("MyKey2", 2);
    assert(hm.valueForKey("MyKey1") == 1);
    assert(hm.valueForKey("MyKey2") == 2);

    try
    {
		hm.valueForKey("MyKey3");
		assert(false);
    }
    catch(Exception e)
    {
		// Key not found…
    }
}
