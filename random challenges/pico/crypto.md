**cryptography**

<summary>hashCrack</summary>
<details>
  3 hashes, all crackstation
<img width="836" height="315" alt="image" src="https://github.com/user-attachments/assets/4d8ecbf0-43d1-424e-906b-a8ca669da6e5" />
</details>

<summary>EVEN RSA CAN BE BROKEN???</summary>
<details>

I say this once, i hate rsa, i may or may not say it again after this

So theres a server
```
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 14570159324663951471122979966311456827668234273483268813457940929029261152833323369388595703776490285482074194479706223302885305058573883483738899395350694
e: 65537
cyphertext: 10441142807661495462312775321599383429865278644814124986145299130101706073923231723423382789262372556296364872952823627626477359384333015878712944830533089
                                                                                
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 23503034755779146759761624606069982666065248191715089135969971748945025255346358174794635858688442288460839577357510332685680318290716444492911825426207798
e: 65537
cyphertext: 4687109704582920567120973689680839753931521380705046280664341556151213039468952165333363350494373351600776767751046017079043711794403387968295008592381613

┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 21979474317849233473218200315734700086989219585162944550979838912706169787886287630703047408028656888631684912554705756931866978020744461365831053237303774
e: 65537
cyphertext: 19927102522024550668250626873442961378007905042302695746000967848637870513814907462412599151826786596466440091282487441197451643970758989676457972200517371
                   
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 15822420101325126920270096437259643133850335738643333144957056412371969937202626299694283165657449657445588922641799443402952785158664905043963409316061094
e: 65537
cyphertext: 10422188263733253858971938049148429314593971492901502508426892429437646074009486599204073414512629669540515342309363911084754929934608035485517885588920671
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 16683208493356149219958090402510457675667835519100339365281201885346932889356837665679818193886842288554333893212260286043313824008651218939732082216522874
e: 65537
cyphertext: 1952650414808092967492999197203808759771433081602816702621991833000059171939944982984664659645820806245138786855605183880249835804303170362824167385769123
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 13589029895249781795481071161526446893759342049986516709730570633329130094244174487120029087803897849935801304358130848988053624788168363738358281100803702
e: 65537
cyphertext: 7413648738741995406160278796370703636001734258512519097120646535647904243643428975151809231508762771564488148687316916110536435511902813079167717499925181
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 26474197832639158536640037421371686425979770699376505814159391533665948765740769098221694717278531584998991410149072800111852862676706393391976409910237662
e: 65537
cyphertext: 11476569962507490852767258865465024801931024976119914110212152593197295625123592488423190385730809788971828520183174188184102610214773574203950732398397447
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 19405980040429053331662196344794638710655729779774699042560201097806640792773368332319711942932251441451577991186275034769316386754207156238243629873086974
e: 65537
cyphertext: 10100223642477722436112542470762683972920898275730204954828774562342153611390476772655132840105507828602504134703175875375135944146973284336680576063752095
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 23206844525872281480197796594179830993086601515562512660500640943575103543671734986481473078649070062746646456681153513315358501024016909203701426813773958
e: 65537
cyphertext: 11068456729310357754126665528288126027521839194469143427469190780794247798779108101359163475251809163850970609267756449149731228081828546731673438657704749
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 24955966922534975248093268386016848587526882195562387241813149423226110069526920718550883171024959196679711189788914273929308347276330049785848918905694122
e: 65537
cyphertext: 9728344856742983558456726264992321912479185181720529829319743119564448508139780223264270558572009817863217601865628714318293752364129669327741667906335435
                                                                                                                                                                                                                                              
┌──(erb㉿rissa)-[~/Downloads]
└─$ nc verbal-sleep.picoctf.net 61776
N: 19034952948504334546076223101853829594566649520446935103673951936670010789527963193116301045811328427968446030494578054928984153998783823900700755605504146
e: 65537
cyphertext: 11840775720088208162917659477090861219902540678964184812501015844037349113261401527107798944212148293836439115498347482214719440928645743107704486961729275
```

After some testing.... I figured might as well try to look into the code

```
from sys import exit
from Crypto.Util.number import bytes_to_long, inverse
from setup import get_primes

e = 65537

def gen_key(k):
    """
    Generates RSA key with k bits
    Start with generating 2 prime P and Q
    multiply them and getting N

    """

    p,q = get_primes(k//2)
    N = p*q
    d = inverse(e, (p-1)*(q-1))

    return ((N,e), d)

    
'''
here is the encryption
'''
def encrypt(pubkey, m):
    N,e = pubkey
    return pow(bytes_to_long(m.encode('utf-8')), e, N)



'''
here is the main function
'''
def main(flag):
    pubkey, _privkey = gen_key(1024)
    encrypted = encrypt(pubkey, flag) 
    return (pubkey[0], encrypted)

if __name__ == "__main__":
    flag = open('flag.txt', 'r').read()
    flag = flag.strip()
    N, cypher  = main(flag)
    print("N:", N)
    print("e:", e)
    print("cyphertext:", cypher)
    exit()
```

Did not see anything useful either, maybe im blind so i looked at the hints and took a long break to learn RSA. 

Hint: How much do we trust randomness?

Not alot??

Hint: Notice anything interesting about N?

N is N, large number tho 

Hint: Try comparing N across multiple requests

Yea good luck with that...



In the end, i refered to this site : https://factordb.com/ and slotted in one of the N since i needed the primes. Apparently, this N divides by 2, and not only this one, a few more too.
```13589029895249781795481071161526446893759342049986516709730570633329130094244174487120029087803897849935801304358130848988053624788168363738358281100803702```

> So back to the hints

  Hint: How much do we trust randomness?
  
  A: How much do i trust the randomness in THIS SCENARIO?
  
  Hint: Notice anything interesting about N?
  
  A: Its even across requests 
  
  Hint: Try comparing N across multiple requests
  
  A: Its even across requests... 


so by using p=2 and q being the other part, This found me the answer. 

```
from Crypto.Util.number import long_to_bytes


p=2
q= 6794514947624890897740535580763223446879671024993258354865285316664565047122087243560014543901948924967900652179065424494026812394084181869179140550401851
e = 65537

n = q*p

c = 7413648738741995406160278796370703636001734258512519097120646535647904243643428975151809231508762771564488148687316916110536435511902813079167717499925181

d = pow(e,-1,((p-1)*(q-1)))


m =  pow(c,d,n)

p = long_to_bytes(m)
print(f"[+] PLAINTEXT (bytes): {p}")
```
</details>



<summary></summary>
<details></details>
