import sys
import os
import glob
import copy

Pass_dir=''
Fail_dir=''
TOTAL_LINE_NUM = 167
#P_list=[[0 for i in range(2)] for j in range (TOTAL_LINE_NUM)]
#F_list=[[0 for i in range(2)] for j in range (TOTAL_LINE_NUM)]
#P_hit_list=[for i in range(TOTAL_LINE_NUM)]
#F_hit_list=[for i in range(TOTAL_LINE_NUM)]

P_file_list=[]
F_file_list=[]

is_gen_statement = 0
statment_list = []


def parse_arg():
    global Pass_dir,Fail_dir

    Pass_dir = sys.argv[1]
    Fail_dir = sys.argv[2]
    #validation
    if os.path.isdir(Pass_dir) is False:
        print(Pass_dir)
        sys.exit("pass dir not found")
    
    if os.path.isdir(Fail_dir) is False:
        print(Fail_dir)
        sys.exit("fail dir not found")


    print("found:\n","PASS dir:  ",Pass_dir,"\n","FAIL dir: ",Fail_dir,"\n")

def comp_num_hit(hit_list,file_path):
    global is_gen_statement,statment_list
    #print(hit_list)
    with open(file_path,'r') as fp:
        lines = fp.readlines()[4:]
    #print(lines)
    for line in lines:
        #print(line)
        line_hit_state  =   line.split(":")[0].split(" ")[-1]
        line_num        =   line.split(":")[1].split(" ")[-1]
        line_statement  =   line.split(":")[2:]
        if(is_gen_statement ==0):
            statment_list.append(line_statement)


        if line_hit_state != '#####' and line_hit_state != '-':
            #print(line_hit_state,"at",int(line_num))
            index = int(line_num) - 1
            if hit_list[index] == -1:
                hit_list[index]=1
            else:
                hit_list[index] += 1

        if line_hit_state == '#####':
            index = int(line_num) - 1
            if hit_list[index] == -1:
                hit_list[index]=0
            else:
                hit_list[index] +=0
    


                
                
                #print(line_hit_state,"---",line_num,"---",line_statement)
                #print("+++",line_hit_state.split(" "),"+++")
                #print("+++",line_statement,"+++")
    #print(hit_list)
    is_gen_statement = 1
    return hit_list




def get_file_list(_dir):
    _list = glob.glob(_dir+'/*.gcov')
    return _list


def get_num_hit(file_list,hit_list):
    for i in range(len(file_list)):
        hit_list=comp_num_hit(hit_list,file_list[i])

    return hit_list



def get_cov(P_file_list,F_file_list,statment_list):
    #1.init P & F hit list
    P_hit_list=[-1 for i in range(TOTAL_LINE_NUM)]
    F_hit_list=[-1 for i in range(TOTAL_LINE_NUM)]
    suspiciousness_list=[-1 for i in range(TOTAL_LINE_NUM)]
    
    #2.get P #hit 
    P_hit_list= get_num_hit(P_file_list,P_hit_list)
    #3.get F #hit 
    F_hit_list= get_num_hit(F_file_list,F_hit_list)
    
    
    #4. Cal cov
    #print(P_hit_list)
    #print(F_hit_list)
    #formula 

    # [F(s) -P(s)  ]/ [p+1]
    total_pass = len(P_file_list)
    print("TOTAL P:",total_pass)
    print("TOTAL F:",len(F_file_list))
    
    

    for i in range(len(P_hit_list)):
        if (P_hit_list[i]!=-1 and F_hit_list[i]!=-1):
            suspiciousness_list[i] = (F_hit_list[i]-P_hit_list[i])
            suspiciousness_list[i] = (float)(suspiciousness_list[i]/(total_pass+1))

    #5. put into dict
    _line_num = list(range(1,TOTAL_LINE_NUM+1))
    #print(_line_num)
    
    #print(suspiciousness_list)
    dict_suspiciousness = dict(zip(_line_num,suspiciousness_list))
    
    for key in list(dict_suspiciousness.keys()):
        if dict_suspiciousness.get(key) == -1:
            del dict_suspiciousness[key]



    _tuple =sorted(dict_suspiciousness.items(), key=lambda item:item[1], reverse=True)
    for i in range(10):
        print(i+1, _tuple[i],statment_list[_tuple[i][0]-1])
    print("-------------------")



    #return sorted(dict_suspiciousness.items(), key=lambda item:item[1], reverse=True)
    return sorted(dict_suspiciousness.items(), key=lambda item:item[1])
    




def get_poss_statement(poss_dict,statment_list):
    for i in range(10):
        print(i+1, poss_dict[i],statment_list[poss_dict[i][0]-1])




def main():
    global Pass_dir,Fail_dir,P_file_list,F_file_list, statment_list
    parse_arg()

    P_file_list=get_file_list(Pass_dir)
    F_file_list=get_file_list(Fail_dir)

    poss_dict=get_cov(P_file_list,F_file_list,statment_list)
    #print(poss_dict)

    get_poss_statement(poss_dict,statment_list)

    #print(statment_list)
    
    #print(F_file_list)
    #read_file(P_list)

if __name__ == "__main__":
    main()




