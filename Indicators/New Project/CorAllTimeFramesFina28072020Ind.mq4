//+------------------------------------------------------------------+
//|                             CorAllTimeFramesFina28102020Ind.mq4  |
//+------------------------------------------------------------------+
//|                             CorAllTimeFramesFina27102017Ind.mq4  |
//|                        Copyright 2015, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2015, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window
string symbols[27];
int    symbolsCountBrother=0;
extern bool DoYoWannaSeeAll=true;
int timeFrameForGraphsChange;
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
extern int PriceType=0;
extern int NumberOfBar=100;
string symbol[50];
string Corolotion[800][2];
int arrayPairA=0;
string table[29][29];
string tableEmpty;
string tableSort1[30][30];
string tableSort5[30][30];
string tableSort15[30][30];
string tableSort30[30][30];
string tableSort60[30][30];
string tableSort240[30][30];
string tableSort1440[30][30];
string tableSort10000[30][30];
string tableSort43000[30][30];
int timeFrameSelection=PERIOD_M1;
string AllTableTabels[29][200];
static bool RunOnlyOnce=true;
//static int count;
static int howManyLinesCount=0;   
int countAllTableTabels=0;
string symbolsCheck[27],BrothersymbolsCheckArray[27];
int BrothersymbolsCheck=0;
int check;
int moveSymDataRight =55, moveSymDataDown=22;

//---Data from main Buttons
string Button1="Visual",Button2="2Charts",Button3="A.Data",Button4="Table";
double spradBetweenTabsMainButtons=1,PutDownByMainButtons=1.9;
int FontSizeMainButtons=10;

int OnInit()
  {
//--- indicator buffers mapping


symbol[0]="CHFJPY";
symbol[1]="USDJPY";
symbol[2]="USDCHF";
symbol[3]="USDCAD";
symbol[4]="EURUSD";
symbol[5]="EURGBP";
symbol[6]="EURJPY";
symbol[7]="EURNZD";
symbol[8]="EURAUD";
symbol[9]="EURCHF";
symbol[10]="EURCAD";
symbol[11]="GBPUSD";
symbol[12]="GBPJPY";
symbol[13]="GBPCHF";
symbol[14]="GBPNZD";
symbol[15]="GBPAUD";
symbol[16]="GBPCAD";
symbol[17]="AUDJPY";
symbol[18]="AUDUSD";
symbol[19]="AUDCHF";
symbol[20]="AUDCAD";
symbol[21]="AUDNZD";
symbol[22]="NZDJPY";
symbol[23]="NZDCHF";
symbol[24]="NZDUSD";
symbol[25]="NZDCAD";
symbol[26]="CADJPY";
symbol[27]="CADCHF";


       ObjectsDeleteAll();
      Comment("                                                                                  Please do double click on this tab. Indicator name is: "+WindowExpertName());


//  Main Button Creation
     static int spradBetweenTabs=75,PutDownBy=3;

     ObjectCreate (Button1,OBJ_BUTTON,0,0,0);
     ObjectSet    (Button1,OBJPROP_XDISTANCE,(0.1)*spradBetweenTabsMainButtons);
     ObjectSet    (Button1,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
     ObjectSetText(Button1,Button1,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (Button2,OBJ_BUTTON,0,0,0);
     ObjectSet    (Button2,OBJPROP_XDISTANCE,(60)*spradBetweenTabsMainButtons);
     ObjectSet    (Button2,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
     ObjectSetText(Button2,Button2,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (Button3,OBJ_BUTTON,0,0,0);
     ObjectSet    (Button3,OBJPROP_XDISTANCE,(120)*spradBetweenTabsMainButtons);
     ObjectSet    (Button3,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
     ObjectSetText(Button3,"CleanDa",FontSizeMainButtons,"Time New Roman",clrGreen);   

     ObjectCreate (Button4,OBJ_BUTTON,0,0,0);
     ObjectSet    (Button4,OBJPROP_XDISTANCE,(180)*spradBetweenTabsMainButtons);
     ObjectSet    (Button4,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
     ObjectSetText(Button4,Button4,FontSizeMainButtons,"Time New Roman",clrGreen);  
     
     ObjectCreate (0,"HHLL",OBJ_LABEL,1,0,0);
     ObjectSet    ("HHLL",OBJPROP_XDISTANCE,(130)*spradBetweenTabsMainButtons);
     ObjectSet    ("HHLL",OBJPROP_YDISTANCE,(0.1)*15);




//---
   return(INIT_SUCCEEDED);
  }

int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double   &open[],
                const double   &high[],
                const double   &low[],
                const double   &close[],
                const long     &tick_volume[],
                const long     &volume[],
                const int      &spread[])
  {
//---


//---For 1M 
  if(RunOnlyOnce==true)
    {
       TakeDataAndMakeTable();
       RunOnlyOnce=false;
    }   

   return(rates_total);
  }

//+------------------------------------------------------------------+
//|  Corolation                                                                |
//+------------------------------------------------------------------+

double Corolation(string symbol1,string symbol2,int i)
{
double corolation=0,Price1[1500],Price2[1500];
double SumPrice1=0,SumPrice2=0;
double Price1MinusSum[1500],Price2MinusSum[1500];
double OneBecomeTwo[1500],SumOneBecomeTwo=0,Bhezka1[1500],Bhezka2[1500],sumHezka1=0,sumHezka2=0;



for(int x=i+8;x>=i;x--)
     {

  if(PriceType==0)
    {
    SumPrice1=SumPrice1+iOpen(symbol1,timeFrameSelection,x);
    SumPrice2=SumPrice2+iOpen(symbol2,timeFrameSelection,x);
     }
  else
    if(PriceType==1)
      {
       SumPrice1=SumPrice1+iClose(symbol1,timeFrameSelection,x);
       SumPrice2=SumPrice2+iClose(symbol2,timeFrameSelection,x);
       }    
     else
      if(PriceType==2)
        {
          SumPrice1=SumPrice1+iHigh(symbol1,timeFrameSelection,x);
          SumPrice2=SumPrice2+iHigh(symbol2,timeFrameSelection,x);
         }        
       else
        if(PriceType==3)
          {
            SumPrice1=SumPrice1+iLow(symbol1,timeFrameSelection,x);
            SumPrice2=SumPrice2+iLow(symbol2,timeFrameSelection,x);
            }            
    
         else
           if(PriceType==4)
             {
              SumPrice1=SumPrice1+(iLow(symbol1,timeFrameSelection,x)+iHigh(symbol1,timeFrameSelection,x))/2;
              SumPrice2=SumPrice2+(iLow(symbol2,timeFrameSelection,x)+iHigh(symbol2,timeFrameSelection,x))/2;
              }                    
    
    
            else
              if(PriceType==5)
                {
                  SumPrice1=SumPrice1+(iLow(symbol1,timeFrameSelection,x)+iHigh(Symbol(),timeFrameSelection,x)+iOpen(symbol1,timeFrameSelection,x)+iClose(symbol1,timeFrameSelection,x))/4;
                  SumPrice2=SumPrice2+(iLow(symbol2,timeFrameSelection,x)+iHigh(symbol2,timeFrameSelection,x)+iOpen(symbol2,timeFrameSelection,x)+iClose(symbol2,timeFrameSelection,x))/4;
                 }                
      }
     
double sum1=SumPrice1/(9),sum2=SumPrice2/(9);;
    
for(int x1=i+8;x1>=i;x1--)
   {        

     Price1MinusSum[x1]=iOpen(symbol1,timeFrameSelection,x1)-sum1;
     Price2MinusSum[x1]=iOpen(symbol2,timeFrameSelection,x1)-sum2;

     
     OneBecomeTwo[x1]=Price1MinusSum[x1]*Price2MinusSum[x1];
     SumOneBecomeTwo=SumOneBecomeTwo+OneBecomeTwo[x1];
     Bhezka1[x1]=Price1MinusSum[x1]*Price1MinusSum[x1];
     Bhezka2[x1]=Price2MinusSum[x1]*Price2MinusSum[x1];



     sumHezka1=sumHezka1+Bhezka1[x1];
     sumHezka2=sumHezka2+Bhezka2[x1];     
     
   }
  if(SumOneBecomeTwo!=0) 
  corolation=SumOneBecomeTwo/MathSqrt(sumHezka1*sumHezka2);
  
return (corolation);
}

//+------------------------------------------------------------------+
//| Corolation By Time Frame                                                                 |
//+------------------------------------------------------------------+
void CorolationByTimeFrame()
  {
double cor;
     for(int two=27;two>=0;two--)
        {
          for(int m=27;m>=0;m--)
        {
           
//---For the row
//            ObjectCreate (symbol[m]+"row", OBJ_LABEL, 0, 0, 0);
//            ObjectSet    (symbol[m]+"row", OBJPROP_XDISTANCE, 0);
//            ObjectSet    (symbol[m]+"row", OBJPROP_YDISTANCE,(1.7+ m)*15);
//            ObjectSetText(symbol[m]+"row",symbol[m], 5, "Time New Roman",Black);
// 
//---Columns
            //ObjectCreate (symbol[m]+"cell", OBJ_LABEL, 0, 0, 0);
            //ObjectSet    (symbol[m]+"cell", OBJPROP_XDISTANCE, (1.5+ m)*32);
            //ObjectSet    (symbol[m]+"cell", OBJPROP_YDISTANCE,15);
            //ObjectSetText(symbol[m]+"cell",symbol[m], 5, "Time New Roman",Black);
            
            
cor=Corolation(symbol[m],symbol[two],NumberOfBar);

if(cor!=1 && cor>0)
  {
     if(cor>0.95)
       {

            //ObjectCreate (symbol[m]+" "+symbol[two], OBJ_LABEL, 0, 0, 0);
            //ObjectSet    (symbol[m]+" "+symbol[two], OBJPROP_XDISTANCE, (1.5+two)*32);
            //ObjectSet    (symbol[m]+" "+symbol[two], OBJPROP_YDISTANCE,(1.7+ m)*15);
            //ObjectSetText(symbol[m]+" "+symbol[two],DoubleToStr(cor,2), 8, "Time New Roman",Green); 
            
            if(DoesExsitsts(arrayPairA,symbol[m],symbol[two])==false)
              {
               Corolotion[arrayPairA][0]=symbol[m];
               Corolotion[arrayPairA][1]=symbol[two];
               arrayPairA++; 
              }
        }       
  }

else
if(cor!=1 && cor<0)
  if(cor<-0.95)
  {
            //ObjectCreate (symbol[m]+" "+symbol[two], OBJ_LABEL, 0, 0, 0);
            //ObjectSet    (symbol[m]+" "+symbol[two], OBJPROP_XDISTANCE, (1.5+two)*32);
            //ObjectSet    (symbol[m]+" "+symbol[two], OBJPROP_YDISTANCE,(1.7+ m)*15);
            //ObjectSetText(symbol[m]+" "+symbol[two],DoubleToStr(cor,2), 8, "Time New Roman",clrMaroon); 
             
            if(DoesExsitsts(arrayPairA,symbol[m],symbol[two])==false)
              {
               Corolotion[arrayPairA][0]=symbol[m];
               Corolotion[arrayPairA][1]=symbol[two];
               arrayPairA++; 
              }              
  } 
 
//---For The Inside

         }   
       }

//       for(int q=0;q<=31;q++)
//        {
//            ObjectCreate (q+"1", OBJ_LABEL, 0, 0, 0);
//            ObjectSet    (q+"1", OBJPROP_XDISTANCE, 0);
//            ObjectSet    (q+"1", OBJPROP_YDISTANCE,(37+ q)*12);
//            ObjectSetText(q+"1",q+  " "+Corolotion[q][0]+"  "+Corolotion[q][1],7, "Time New Roman",clrIndigo);
//            
//         }  
         
//---For Arranging Table Of Pairs In Curency
       int row=1;
       string anotherSymbol=symbol[0];
       int symbolsCount=-1,countCheker=0;//,CountIsSymbolIsExists=0;
       for(int tab=0;tab<=27;)
          {
//---As long is there is that symbol, keep looking
         for(;IsExsits(anotherSymbol)==true;)    
            {
            
          if(IsExsits(anotherSymbol)==true)
            {
            if(row==1)
              {
             table[row-1][tab]=anotherSymbol;
             BrothersymbolsCheckArray[BrothersymbolsCheck]=anotherSymbol;
              }
              
//---For the Next Search, keep adding
             symbolsCount++;
             symbols[symbolsCount]=ArrangeInTableCor(anotherSymbol,row,tab);
            if(symbols[symbolsCount]!="Non")
               row++;
             }
          else
            {
             tab++;
             table[row][tab-1]="---";
             row=1;
             anotherSymbol=symbol[tab];
             symbolsCount=-1; 
             countCheker=0;
             symbolsCountBrother=0;
             BrothersymbolsCheck=0;       
             ArrayResize(BrothersymbolsCheckArray,0);
             ArrayResize(BrothersymbolsCheckArray,27);             
            } 
            }
            
       symbolsCountBrother=symbolsCount;  
         
       for(;symbolsCount>=0;)
            {
         
          if(IsExsits(symbols[symbolsCount])==true)
            {

            static string s;
            
            if(ArrangeInTableCorAditinalScan(symbols[symbolsCount],row,tab)==true)
              {
                 row++;
              }
             }
           else
             symbolsCount--;

            }        
        
            ArrayResize(symbols,0);
            ArrayResize(symbols,27);

          if(IsExsits(anotherSymbol)==false)
            {
//---For Aditioanal Check---------------------------------------------------------------------------------------
     if(BrothersymbolsCheck!=0)
       for(;BrothersymbolsCheck>=0;)
            {
            if(ArrangeInTableCorAditinalScanBrother(BrothersymbolsCheckArray[BrothersymbolsCheck],row,tab)==true)
              {
               row++;
              }
              
           else
             BrothersymbolsCheck--;              
             }

            
             //Print("------------------");  
             tab++;
             table[row][tab-1]="---";
             row=1;
             anotherSymbol=symbol[tab];
             symbolsCount=-1; 
             countCheker=0;
             symbolsCountBrother=0;
             BrothersymbolsCheck=0;       
             ArrayResize(BrothersymbolsCheckArray,0);
             ArrayResize(BrothersymbolsCheckArray,27);
             
            }             
            
          }
          
          
        }          
//+------------------------------------------------------------------+
//|TakeDataAndMakeTable                                                                  |
//+------------------------------------------------------------------+
void TakeDataAndMakeTable()
    {
//---For 1M
    timeFrameSelection=PERIOD_M1;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);
    CorolationByTimeFrame();   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort1[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort1[0][howManyLinesCount]="---";

//---For 5M
    timeFrameSelection=PERIOD_M5;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort5[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort5[0][howManyLinesCount]="---";
//---For 15M
    timeFrameSelection=PERIOD_M15;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort15[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort15[0][howManyLinesCount]="---";
//---For 30M
    timeFrameSelection=PERIOD_M30;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort30[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort30[0][howManyLinesCount]="---";
//---For 60M
    timeFrameSelection=PERIOD_H1;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort60[c][count]=table[c][z];
               }
             }
          count++;
          
          }
       } 
       
    tableSort60[0][howManyLinesCount]="---";
//---For 240M
    timeFrameSelection=PERIOD_H4;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort240[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort240[0][howManyLinesCount]="---";

//---For 1440M
    timeFrameSelection=PERIOD_D1;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort1440[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort1440[0][howManyLinesCount]="---";
//---For 10000M
    timeFrameSelection=PERIOD_W1;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort10000[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort10000[0][howManyLinesCount]="---";
//---For 43000M
    timeFrameSelection=PERIOD_MN1;
    ArrayResize(table,0,0);
    ArrayResize(table,29,29);    
    CorolationByTimeFrame();
    howManyLinesCount=0;   
    for(int z=27;z>=0;z--)
       {
        if(table[1][z]!="---")
          {
          howManyLinesCount++;
          static int count=0;
          for(int c=27;c>=0;c--)
             {
             if(count<29)
               {
                tableSort43000[c][count]=table[c][z];
                
               }
             }
          count++;
          
          }
       } 
       
    tableSort43000[0][howManyLinesCount]="---";

//+------------------------------------------------------------------+
//| //---All Times In one Frame                                                                 |
//+------------------------------------------------------------------+
//---1M

    AllTableTabels[0][0]="---1M---";
    for(int z=0;z<=27;z++)
       {
        if(tableSort1[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort1[c][z];
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }   
//---5M
    AllTableTabels[0][countAllTableTabels]="---5M---";
    
    for(int z=0;z<=27;z++)
       {
        if(tableSort5[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort5[c][z];
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }   

//---15M
    AllTableTabels[0][countAllTableTabels]="---15M---";
      for(int z=0;z<=27;z++)
       {
        if(tableSort15[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort15[c][z];
                //Comment(tableSort15[0][0]+"  1111");
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }
         
//---30m
    AllTableTabels[0][countAllTableTabels]="---30M---";      
      for(int z=0;z<=27;z++)
       {
        if(tableSort30[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort30[c][z];
                //Comment(tableSort15[0][0]+"  1111");
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }

//---1H

    AllTableTabels[0][countAllTableTabels]="---1H---";  
      for(int z=0;z<=27;z++)
       {
        if(tableSort60[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort60[c][z];
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }    
    
//---4H

    AllTableTabels[0][countAllTableTabels]="---4H---";  
      for(int z=0;z<=27;z++)
       {
        if(tableSort240[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort240[c][z];
               }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }        
//---1D

    AllTableTabels[0][countAllTableTabels]="---1D---";  
      for(int z=0;z<=27;z++)
       {
        if(tableSort1440[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort1440[c][z];
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }            
    
//---1W

    AllTableTabels[0][countAllTableTabels]="---1W---";  
      for(int z=0;z<=27;z++)
       {
        if(tableSort10000[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort10000[c][z];
                //Comment(tableSort15[0][0]+"  1111");
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }                
    
 //---1M

    AllTableTabels[0][countAllTableTabels]="---1MN---";  
      for(int z=0;z<=27;z++)
       {
        if(tableSort43000[0][z]!="---")
          {
          countAllTableTabels++;
          for(int c=27;c>=0;c--)
             {
             if(countAllTableTabels<=198)
               {
                AllTableTabels[c][countAllTableTabels]=tableSort43000[c][z];
                }
             }
          } 
          else
           {
            z=30;
            countAllTableTabels++;
            }
         }                
    AllTableTabels[0][countAllTableTabels]="---";  
    ArrayResize(AllTableTabels,29,countAllTableTabels);
    
    int countOportunety=0;
    int OpenCount=0;
 
   for(int mTable=0;mTable<=countAllTableTabels;mTable++)
          {      
            if(AllTableTabels[0][mTable]=="---")
             {
               mTable=countAllTableTabels;
             } 
          
          
     for(int Tabletwo=0;Tabletwo<=27;Tabletwo++)
        {  
            {
             ObjectCreate (string(Tabletwo)+" "+string(mTable), OBJ_LABEL, 0, 0, 0);
             ObjectSet    (string(Tabletwo)+" "+string(mTable), OBJPROP_XDISTANCE, (0.3+Tabletwo)*moveSymDataRight);
             ObjectSet    (string(Tabletwo)+" "+string(mTable), OBJPROP_YDISTANCE,(1.7+ mTable)*moveSymDataDown);
             static bool is1m=false,is5m=false,is15m=false,is30m=false,is1H=false,is4H=false,is1D=false,is1W=false,is1MN=false;
                 
                 if(AllTableTabels[Tabletwo][mTable]=="---1M---")
                   {
                   is1m=true; 
                   countOportunety++;
                   //Comment(AllTableTabels[Tabletwo][mTable]);
                   }        

                 if(AllTableTabels[Tabletwo][mTable]=="---5M---")
                   {
                   is5m=true; 
                   countOportunety++;
                   //Comment(AllTableTabels[Tabletwo][mTable]);
                   }        
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---15M---")
                   {
                    is15m=true;  
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                              
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---30M---")
                   {
                    is30m=true;
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }       
                   
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---1H---")
                   {
                    is1H=true;  
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                              
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---4H---")
                   {
                    is4H=true;
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                                                                                                   
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---1D---")
                   {
                    is1D=true;
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                                                                                                                   
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---1W---")
                   {
                    is1W=true;               
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                                                                                                      
               else
                 if(AllTableTabels[Tabletwo][mTable]=="---1MN---")
                   {
                    is1MN=true; 
                    countOportunety++;
                    //Comment(AllTableTabels[Tabletwo][mTable]);
                   }                                                                                                                                  

              
                    
                    
                    
            if(AllTableTabels[Tabletwo][mTable]=="---4H---" || AllTableTabels[Tabletwo][mTable]=="---1D---" || AllTableTabels[Tabletwo][mTable]=="---1W---" || AllTableTabels[Tabletwo][mTable]=="---1MN---" )
              ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+"  -------------------------------------------------------", 7, "Time New Roman",clrBlueViolet);   
                                               
            else                                             
                    
                                      
             if(StringSubstr(AllTableTabels[Tabletwo][mTable],0,3)=="---")
               {
               
                ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable]), 7, "Time New Roman",clrLime); 
                
               }
             else
               if((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_M1,0) || 
                  iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_M1,0)))
                      {
                       countOportunety++; 
                       OpenCount++;
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable]), 5, "Time New Roman",Red);   
                      }             
             else
               if((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_M5,0) || 
                  iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_M5,0)) && is5m==true)
                     {
                       countOportunety++; 
                       OpenCount++;                                   
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 5m", 5, "Time New Roman",Blue);
                     }        
                       
             else
               if((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_M15,0) || 
                  iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_M15,0)) && is15m==true)
                     {
                       countOportunety++;   
                       OpenCount++;                                   
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 15m", 5, "Time New Roman",clrPurple);                               
                     } 
             else
               if((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_M30,0) || 
                  iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_M30,0)) && is30m==true)
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 30m", 5, "Time New Roman",clrMediumVioletRed);        


             else
               if((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_H1,0) || 
                  iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_H1,0)) && is1H==true)
                     {
                       countOportunety++; 
                       OpenCount++;                                   
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 1H", 5, "Time New Roman",clrMagenta);                               
                       
                      }                 
             else
               if((High[iHighest(Symbol(),PERIOD_H4,MODE_HIGH,100,0)]==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_H4,0) || 
                 Low[iLowest(Symbol(),PERIOD_H4,MODE_LOW,100,0)]==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_H4,0)) && is4H==true)
                     {
                       countOportunety++;
                       OpenCount++;                                   
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 4H", 5, "Time New Roman",clrDeepSkyBlue);   
                      }                            
             else
               if((High[iHighest(Symbol(),PERIOD_W1,MODE_HIGH,100,0)]==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0) || 
                  Low[iLowest(Symbol(),PERIOD_W1,MODE_LOW,100,0)]==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)) && is1D==true)
                     {
                       countOportunety++;
                       OpenCount++;                                   
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 1D", 5, "Time New Roman",Blue);        
                     }                       
             else
               if((High[iHighest(Symbol(),PERIOD_W1,MODE_HIGH,100,0)]==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_W1,0) || 
                  Low[iLowest(Symbol(),PERIOD_W1,MODE_LOW,100,0)]==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_W1,0)) && is1W==true)
                  {
                  countOportunety++;
                  
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 1W", 5, "Time New Roman",clrGreen);                                              
                  }
             else
               if((High[iHighest(Symbol(),PERIOD_MN1,MODE_HIGH,100,0)]==iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_MN1,0) || 
                  Low[iLowest(Symbol(),PERIOD_MN1,MODE_LOW,100,0)]==iLow(AllTableTabels[Tabletwo][mTable],PERIOD_MN1,0)) && is1MN==true)
                     {
                       ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+" 1MN", 5, "Time New Roman",Gray);
                       countOportunety++;
                      }                                                              
               else
                 {
                 
                    //---For Up Move
                      if(iOpen(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)<iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))
                        {
                         ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+"  "+
                                       DoubleToStr((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10,1)+"+"
                                       , 5, "Time New Roman",clrSilver);  
                         if(((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10)<10)
                            ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+"  "+
                                         DoubleToStr((iHigh(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10,1)+"+"
                                         , 5, "Time New Roman",White);                           
                        }
                   //---For Down Move
                   else
                      if(iOpen(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)>iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))
                        {
                         ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+"  "+
                                       DoubleToStr((iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10,1)+"-"
                                       , 5, "Time New Roman",clrSilver);  
                         if(((iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10)<10)
                            ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable])+"  "+
                                          DoubleToStr((iClose(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0)-iLow(AllTableTabels[Tabletwo][mTable],PERIOD_D1,0))/SymbolInfoDouble(AllTableTabels[Tabletwo][mTable],SYMBOL_POINT)/10,1)+"-"
                                          , 5, "Time New Roman",White);                           
                         
                        }                                      
                 
                 
                 
                 else
                   {                 
                    ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable]), 5, "Time New Roman",clrDimGray); 
                   }
                 
                 
                 if((PairIsAlreadyOpen(AllTableTabels[Tabletwo][mTable])==true )  // && countOportunety==0)
                    
                   )
                   {
                    ObjectSetText(string(Tabletwo)+" "+string(mTable),string(AllTableTabels[Tabletwo][mTable]), 5, "Time New Roman",White); 
                   }
                 
                 }


                 
            if((AllTableTabels[Tabletwo][mTable]=="---") || StringSubstr(AllTableTabels[Tabletwo][mTable],0,3)=="---")
             {

               Tabletwo=27;
             }   
            }
          }   
  if(DoYoWannaSeeAll==true)        
   if(countOportunety==0)
      for(int x=0;x<=27;x++)
              {
              //Comment("sdfsf  "+x+"  "+mTable);
              ObjectDelete(string(x)+" "+string(mTable));
              }    
      countOportunety=0;          
       }
    OpenCount=0;
    }
    
//+------------------------------------------------------------------+
//| PairIsAlreadyOpen                                                                 |
//+------------------------------------------------------------------+
 bool PairIsAlreadyOpen(string OpenPair)
     {
      for(int j=OrdersTotal();j>=0;j--)
         {
          check = OrderSelect(j,SELECT_BY_POS,MODE_TRADES);
          //Print(OrderSelect(j,SELECT_BY_POS,MODE_TRADES)+"  "+OpenPair);
          if(OrderSymbol()==OpenPair)
            return(true);
         }
         
       return(false);  

     }   

//+------------------------------------------------------------------+
//| For Aditional cheack                                                                 |
//+------------------------------------------------------------------+
 
bool ArrangeInTableCorAditinalScanBrother(string Pair,int tableRow,int tableTab)
  {
      ArrayResize( Corolotion,801,100);
    bool WhatBool=false;
    for(int w=0;w<=800;w++)
       {
         if(Corolotion[w][0]==Pair)
           {
           
           
           if(IsAlreadyExsits(Corolotion[w][1])==false)
             {
             if(isExistsInRow(Corolotion[w][1])==false) 
               {            
                table[tableRow][tableTab]=Corolotion[w][1];
                WhatBool=true;
               }
              BrothersymbolsCheck++;             
              BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][1];              
              //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"  3  ");
              Corolotion[w][0]=string(EMPTY_VALUE);
              Corolotion[w][1]=string(EMPTY_VALUE);
              
              return(WhatBool);
              }
            
              Corolotion[w][0]=string(EMPTY_VALUE);
              Corolotion[w][1]=string(EMPTY_VALUE);
              
            }
         else
           if(Corolotion[w][1]==Pair)
             { 
             if(IsAlreadyExsits(Corolotion[w][0])==false)
                {
                if(isExistsInRow(Corolotion[w][0])==false)
                  {             
                   table[tableRow][tableTab]=Corolotion[w][0];
                   WhatBool=true;
                   }
                   
                BrothersymbolsCheck++;
                BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][0];                             
                //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"  4");
                Corolotion[w][0]=string(EMPTY_VALUE);
                Corolotion[w][1]=string(EMPTY_VALUE);
                return(WhatBool);
                }
                Corolotion[w][0]=string(EMPTY_VALUE);
                Corolotion[w][1]=string(EMPTY_VALUE);
                
             }           
       }
    return(WhatBool);
  } 
  
//+------------------------------------------------------------------+
//| IsExsits                                                                 |
//+------------------------------------------------------------------+
bool IsExsits(string Pair)
  {
    for(int w=0;w<=730;w++)
       {
       //if(Corolotion[w][1]!=EMPTY_VALUE )
         if(Corolotion[w][0]==Pair || Corolotion[w][1]==Pair)
           {
            //Print(Corolotion[w][0]+"  ----f----  "+Corolotion[w][1]+"  ----f----  "+Pair);
            return(true);
            }
       }
     return(false);  
  }
//+------------------------------------------------------------------+
//| ArrangeInTableCor And Removes What Has Been In                                                                 |
//+------------------------------------------------------------------+
string ArrangeInTableCor(string Pair,int tableRow,int tableTab)
  {
  string a;
    ArrayResize( table,100,100);
    for(int w=0;w<=800;w++)
       {
         string sym;
         if(Corolotion[w][0]==Pair)
           {
            table[tableRow][tableTab]=Corolotion[w][1];
            sym=Corolotion[w][1];
            BrothersymbolsCheck++;             
            BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][1];                          
            //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"   2.1");
            Corolotion[w][0]=string(EMPTY_VALUE);
            Corolotion[w][1]=string(EMPTY_VALUE);
            //ArrayResize( table,29,29);
            return(sym);
            }
         else
           if(Corolotion[w][1]==Pair)
             { 
              table[tableRow][tableTab]=Corolotion[w][0];
              sym=Corolotion[w][0];
              BrothersymbolsCheck++;             
              BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][0];                            
              //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"   3.1");
              Corolotion[w][0]=string(EMPTY_VALUE);
              Corolotion[w][1]=string(EMPTY_VALUE);
              return(sym);
             }           
       }
       return("Non");
  }

bool ArrangeInTableCorAditinalScan(string Pair,int tableRow,int tableTab)
  {
      ArrayResize( Corolotion,801,100);
      bool WhatBool=false;

    for(int w=0;w<=800;w++)
       {
         if(Corolotion[w][0]==Pair)
           {
           
           
           if(IsAlreadyExsits(Corolotion[w][1])==false)
             {
             if(isExistsInRow(Corolotion[w][1])==false) 
               {            
                table[tableRow][tableTab]=Corolotion[w][1];
                WhatBool=true;
                }
              BrothersymbolsCheck++;             
              BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][1];              
              //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"  3  ");
              Corolotion[w][0]=string(EMPTY_VALUE);
              Corolotion[w][1]=string(EMPTY_VALUE);
              
              return(WhatBool);
              }
            
              Corolotion[w][0]=string(EMPTY_VALUE);
              Corolotion[w][1]=string(EMPTY_VALUE);
              
            }
         else
           if(Corolotion[w][1]==Pair)
             { 
             if(IsAlreadyExsits(Corolotion[w][0])==false)
                {
                if(isExistsInRow(Corolotion[w][0])==false)   
                  {          
                   table[tableRow][tableTab]=Corolotion[w][0];
                   WhatBool=true;
                  }
                   
                BrothersymbolsCheck++;
                ArrayResize( BrothersymbolsCheckArray,60);
                BrothersymbolsCheckArray[BrothersymbolsCheck]=Corolotion[w][0];                             
                //Print(BrothersymbolsCheckArray[BrothersymbolsCheck]+"  4");
                Corolotion[w][0]=string(EMPTY_VALUE);
                Corolotion[w][1]=string(EMPTY_VALUE);
                return(WhatBool);
                }
                Corolotion[w][0]=string(EMPTY_VALUE);
                Corolotion[w][1]=string(EMPTY_VALUE);
                
             }           
        
       }
    return(WhatBool);
       
  }
  
//+------------------------------------------------------------------+
//|Is There is exists in Row                                                                  |
//+------------------------------------------------------------------+
bool isExistsInRow(string PairBrother)
    {

    int L=BrothersymbolsCheck;
    for(;L>=0;L--)
       {//Print(L);
       if(BrothersymbolsCheckArray[L]==PairBrother)
         {
          //Print(BrothersymbolsCheckArray[L]+"=="+PairBrother+"  "+L);
          return(true);
          }       
        }
    return(false);
    }
//+------------------------------------------------------------------+
//|  Is Already Exsits                                               |
//+------------------------------------------------------------------+
 bool IsAlreadyExsits(string ChosenPair)

    {  
     for(int i=symbolsCountBrother;i>=0;i--)
        {
        //Print(symbols[i]+"  "+i+"  "+ChosenPair);
          if(symbols[i]==ChosenPair)
            return(true);        
        }
     return(false);
   }

//+------------------------------------------------------------------+
//| Check if pair allready exsists And Removes if Yes                                                               |
//+------------------------------------------------------------------+
bool DoesExsitsts(int array,string PairA,string PairB)
  {
    for(int w=0;w<=array;w++)
       {
         if((Corolotion[w][0]==PairA && Corolotion[w][1]==PairB) || 
            (Corolotion[w][0]==PairB && Corolotion[w][1]==PairA))
            return(true);
       }
     return(false);  

  }
//+------------------------------------------------------------------+
//| ChartEvent function
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
  
 for(int i=0;i<=ObjectsTotal()-1;i++)
    {
    if(sparam==ObjectName(i)) 
      {
      
                 if(ObjectGetString(0,sparam,OBJPROP_TEXT)=="---1M---")
                   {
                    timeFrameForGraphsChange=PERIOD_M1;
                   
                   }        
               else
                 if(ObjectGetString(0,sparam,OBJPROP_TEXT)=="---5M---")
                   {
                    timeFrameForGraphsChange=PERIOD_M5;

                   }        
               else
                 if(ObjectGetString(0,sparam,OBJPROP_TEXT)=="---15M---")
                   {
                    timeFrameForGraphsChange=PERIOD_M15;
                   }                                              
               else
                 if(ObjectGetString(0,sparam,OBJPROP_TEXT)=="---30M---")
                   {
                    timeFrameForGraphsChange=PERIOD_M30;
                   }       
                   
               else
                 if(ObjectGetString(0,sparam,OBJPROP_TEXT)=="---1H---")
                   {
                    timeFrameForGraphsChange=PERIOD_H1;
                    //Comment(timeFrameForGraphsChange);
                   }                           
       if(ObjectGetInteger(0,ObjectName(i),OBJPROP_COLOR)==Silver)
         {

          SecondChart(ObjectGetString(0,sparam,OBJPROP_TEXT));  
          
          
          }
       else
          FirstChart(ObjectGetString(0,sparam,OBJPROP_TEXT));  
      }
    }
    
   if(sparam==Button1)
     {
      ObjectsDeleteAll();

      ChartApplyTemplate(0,"ProjectTime0ooooo.tpl");

     }

   if(sparam==Button2)
     {
      ObjectsDeleteAll();

      ChartApplyTemplate(0,"ProjectTime1ooooo.tpl");
     }

   if(sparam==Button3)
     {
      ObjectsDeleteAll();

      ChartApplyTemplate(0,"ProjectTime2ooooo.tpl");
     }

   if(sparam==Button4)
     {
      ObjectsDeleteAll();

      ChartApplyTemplate(0,"ProjectTime3ooooo.tpl");

     }    
  }

//---------------------------------------------------------------+
//| Change First Chart
//+------------------------------------------------------------------+
void FirstChart(string sym)
  {
   ChartSetSymbolPeriod(ChartFirst(),StringSubstr(sym,0,6),timeFrameForGraphsChange);
   //Comment(timeFrameForGraphsChange);
  }

//---------------------------------------------------------------+
//| Change Second Chart
//+------------------------------------------------------------------+
void SecondChart(string sym)
  {
  //Comment(StringSubstr(symbol,0,6));
   ChartSetSymbolPeriod(ChartNext(ChartFirst()),StringSubstr(sym,0,6),timeFrameForGraphsChange);
   //Comment(timeFrameForGraphsChange);
  }