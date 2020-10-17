#include<iostream>
#include<thread>
#include<mutex>
#include<list>
using namespace std;
 

class MsgManage
{
public:
	MsgManage() {}
	~MsgManage() {}
	void InMsg()
	{
		for (int i = 0; i < 10000 ; i++)
		{
			cout << "insert elts: " << i << endl;
			myMutex1.lock();     //loc1, then loc2
			myMutex2.lock();
			myList.push_back(i);
			myMutex2.unlock();
			myMutex1.unlock();
 
		}
	}
	//dead lock
	bool outMsgProc(int &num)
	{
		myMutex2.lock();       //loc2，then loc1
		myMutex1.lock();
		if (!myList.empty())
		{
			num = myList.front();
			myList.pop_front();
			myMutex1.unlock();
			myMutex2.unlock();
			return true;
		}
		myMutex1.unlock();
		myMutex2.unlock();
		return false;
	}
//no dead lock
/*
	bool outMsgProc(int &num)
	{
		myMutex1.lock();       //loc1, then 2
		myMutex2.lock();
		if (!myList.empty())
		{
			num = myList.front();
			myList.pop_front();
			myMutex1.unlock();
			myMutex2.unlock();
			return true;
		}
		myMutex1.unlock();
		myMutex2.unlock();
		return false;
	}
*/
	void OutMsg()
	{
		for (int i = 0; i < 10000; i++)
		{
			int num;
 
			bool result = outMsgProc(num);
 
			if (result)
			{
				cout << "remove elt: " << num << endl;
			}
			else
			{
				cout << "empty q" << endl;
			}
		}
	}
private:
	list<int> myList;
	mutex myMutex1;
	mutex myMutex2;
};
 
int main()
{
	MsgManage manage;
	thread outMsg(&MsgManage::OutMsg, &manage);
	thread inMsg(&MsgManage::InMsg, &manage);
	inMsg.join();
	outMsg.join();
 
	return 0;
}
