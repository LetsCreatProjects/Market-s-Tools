//+------------------------------------------------------------------+
//|                                  TableCristalBall28072020Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall13112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall08112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall07112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall05112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall31102018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall29102018Ind.mq4 |

//|                                  TableCristalBall28102018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall25102018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                 TableCristalBall21102018Ind‏.mq4 |
//+------------------------------------------------------------------+
//|                                  TableCristalBall21102018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                                        test6.mq4 |
//|                        Copyright 2018, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+

#property copyright "Copyright 2018, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window

string OpenOrderData[1000][1000];
extern int BBpipsDivietion=30;
int tab=14;
int rowsMW=SymbolsTotal(true)-1;//rows
double array[40][100];
//string DicrionaryArray{"sdf","afd","af"};
double spradBetweenTabsMainButtons=1,PutDownByMainButtons=1.9;
int FontSizeMainButtons=10;

string Button1="Visual",Button2="2Charts",Button3="A.Data",Button4="Table";


string DicrionaryArray[]=
  {
   "Symb.",
   "Sup.TrendBoar",
   "PFromSupTren",
   "DepperCorrec",
   "sDividedD%",
   "AvgAtrDay",
   "HHLL",
   "Magafon",
   "ThreeAm",
   "PfromHHLLD",
   "BBspread",
   "BBatr",
   "BBavg",
   "BBDiviet",
   "CurPipBarHL",
   "LotSumAccou",//"FromInt",//"FromMt4Real",
  };
 
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void MainFunc()
  {
   //"Symb.",

   HHLL("HHLL");   
   LotSumAccounts("LotSumAccou");//"FromInt",//"FromMt4Real",
   SuperTrendBoard("Sup.TrendBoar");         
   //DepperCorrection
   //"PFromSupTren"
   CurrentPfromHHLL("PfromHHLLD");
   ThreeAm("ThreeAm"); 
   AvgAtrDay("AvgAtrDay");
   BBtable("BBatr","BBavg","BBDiviet","BBspread");   
   Magafon("Magafon");   
   sDividedD("sDividedD%");   
   CurrentPipsBarHHLL("CurPipBarHL");        
  }
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
tab=ArraySize(DicrionaryArray);
ArrayResize(array,rowsMW+1);

   Comment("                                                                                                                                                                       "+WindowExpertName());

//--------------------------------------
   for(int y=0;y<=rowsMW;y++)
     {
      array[y][0]=y;
     }

   //ObjectsDeleteAll();
   
   MainFunc();
   DrawTable();

//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Custom indicator iteration function                              |
//+------------------------------------------------------------------+
int OnCalculate(const int rates_total,
                const int prev_calculated,
                const datetime &time[],
                const double &open[],
                const double &high[],
                const double &low[],
                const double &close[],
                const long &tick_volume[],
                const long &volume[],
                const int &spread[])
  {
//---

//--- return value of prev_calculated for next call
   return(rates_total);
  }
//+------------------------------------------------------------------+
void DrawTable()
  {
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
     
     double Atr14=iATR(Symbol(),PERIOD_CURRENT,14,1)/MarketInfo(Symbol(),MODE_POINT)/10;

     if(iClose(Symbol(),PERIOD_CURRENT,0)<iOpen(Symbol(),PERIOD_CURRENT,0))
        ObjectSetText("HHLL","14Atr= "+string(Atr14)+
                              "  FromDownToUp= "+string(NormalizeDouble(((iHigh(Symbol(),PERIOD_CURRENT,0)-iClose(Symbol(),PERIOD_CURRENT,0))/MarketInfo(Symbol(),MODE_POINT)/10*-1),0))+"  pips"+
                              "  HHLL= "+string(NormalizeDouble(((iHigh(Symbol(),PERIOD_CURRENT,0)-iLow(Symbol(),PERIOD_CURRENT,0))/MarketInfo(Symbol(),MODE_POINT)/10),0))+"  pips",
                              FontSizeMainButtons,"Time New Roman",clrRed);   
     else
        ObjectSetText("HHLL","14Atr= "+string(Atr14)+
                             "   FromUpToDown= "+string(NormalizeDouble(((iClose(Symbol(),PERIOD_CURRENT,0)-iLow(Symbol(),PERIOD_CURRENT,0))/MarketInfo(Symbol(),MODE_POINT)/10),0))+"  pips"+
                             "  HHLL= "+string(NormalizeDouble(((iHigh(Symbol(),PERIOD_CURRENT,0)-iLow(Symbol(),PERIOD_CURRENT,0))/MarketInfo(Symbol(),MODE_POINT)/10),0))+"  pips",
                             FontSizeMainButtons,"Time New Roman",clrBlue);   

for(int headline=0; headline<=tab-1;headline++)
     {
      ObjectCreate(IntegerToString(headline),OBJ_LABEL,0,0,0);
      ObjectSet(IntegerToString(headline),OBJPROP_XDISTANCE,(0.1+headline)*spradBetweenTabs);
      ObjectSet(IntegerToString(headline),OBJPROP_YDISTANCE,(PutDownBy-1)*15);
      ObjectSetText(IntegerToString(headline),DicrionaryArray[headline],7,"Arial Bold",clrBlack);
     }

for(int y=0;y<=rowsMW;y++)
      {
      ObjectCreate (SymbolName(int(array[y][0]),true),OBJ_LABEL,0,0,0);
      ObjectSet    (SymbolName(int(array[y][0]),true),OBJPROP_XDISTANCE, (0.2)*50);
      ObjectSet    (SymbolName(int(array[y][0]),true), OBJPROP_YDISTANCE,(PutDownBy+y)*15);
      ObjectSetText(SymbolName(int(array[y][0]),true),SymbolName(int(array[y][0]),true),7,"Arial Bold",clrBlack);
    
     for(int x=1;x<=tab-1;x++)
        {

         ObjectCreate(IntegerToString(x)+","+IntegerToString(y),OBJ_LABEL,0,0,0);
         ObjectSet(IntegerToString(x)+","+IntegerToString(y),OBJPROP_XDISTANCE,(0.2+x)*spradBetweenTabs);
         ObjectSet(IntegerToString(x)+","+IntegerToString(y),OBJPROP_YDISTANCE,(PutDownBy+y)*15);
         ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),7,"Time New Roman",clrBlack);
         
//---
         if(x==FindNumTab("BBatr"))
           {
           if(array[y][FindNumTab("BBspread")]<0)
             array[y][FindNumTab("BBspread")]*=-1;
             
           if(array[y][FindNumTab("BBspread")]>array[y][x])
             ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);
            }
            
//---
         if(x==FindNumTab("BBavg"))
           {
            if(array[y][FindNumTab("BBspread")]<0)
               array[y][FindNumTab("BBspread")]*=-1;
           
            if(array[y][FindNumTab("BBspread")]>array[y][x])
              ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);         
           }
//---
         if(x==FindNumTab("BBDiviet"))
           {
           if(array[y][FindNumTab("BBspread")]<0)
              array[y][FindNumTab("BBspread")]*=-1;
           
           if(array[y][FindNumTab("BBspread")]>(array[y][x]+array[y][FindNumTab("BBavg")]))
             ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);                  
           }
//---
         if(x==FindNumTab("Sup.TrendBoar"))
           if( ( array[y][x]<-550 && array[y][FindNumTab("PFromSupTren")]>-25 ) || (array[y][x]>550 && array[y][FindNumTab("PFromSupTren")]<25) )
              ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);         
//---
         if(x==FindNumTab("AvgAtrDay"))
           {
            if( array[y][x]<0 && array[y][x]>iHigh(SymbolName(int(array[y][0]),true),PERIOD_D1,0)-iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0) )
              ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);         
            if( array[y][x]<0 && array[y][x]>iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)-iLow(SymbolName(int(array[y][0]),true),PERIOD_D1,0) )
              ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMediumBlue);         
           }
//---
         if(x==FindNumTab("CurPipBarHL"))
           {
             if(iHigh(SymbolName(int(array[y][0]),true),PERIOD_M5,0)-iLow(SymbolName(int(array[y][0]),true),PERIOD_M5,0)>iATR(SymbolName(int(array[y][0]),true),PERIOD_D1,14,1)/2 )
                ObjectSetText(IntegerToString(x)+","+IntegerToString(y),string(array[y][x]),8,"Arial Bold",clrMagenta);         
           }
        }
    }
  }
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+
void ArrayTwist(int headL)
  {
   double arrTwist[100];
 
   for(int y=0;y<=rowsMW;y++)
     {
      arrTwist[y]=array[y][0];
      array[y][0]=array[y][headL];
      array[y][headL]=arrTwist[y];
     }
  }
  
//+------------------------------------------------------------------+
//| Set chart scale (from 0 to 5).                                   |
//+------------------------------------------------------------------+
bool ChartScaleSet(bool value,const long chart_ID=0)
  {
//--- reset the error value
   ResetLastError();
//--- set property value
   if(!ChartSetInteger(chart_ID,CHART_SCALEFIX_11,0,value))
     {
      //--- display the error message in Experts journal
      Print(__FUNCTION__+", Error Code = ",GetLastError());
      return(false);
     }
//--- successful execution
   return(true);
  }  
  
//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
  
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
//---
   for(int headline=0; headline<=tab;headline++)
     {
      if(sparam==IntegerToString(headline))
        {
         //ObjectsDeleteAll();
         //MainFunc();
         ArrayTwist(headline);
         ArraySort(array,0,0,MODE_DESCEND);
         ArrayTwist(headline);
         DrawTable();

        }
     }
 
 
   for(int y=0;y<=rowsMW;y++)
      {
       if(sparam==SymbolName(y,true))
         ChartSetSymbolPeriod(ChartFirst(),SymbolName(y,true),PERIOD_CURRENT);
      }
  }

 void AvgAtrDay(string HeadName)
 {
 for(int y=0;y<=rowsMW;y++)
    {
      array[y][FindNumTab(HeadName)]=NormalizeDouble(iATR(SymbolName(int(array[y][0]),true),PERIOD_D1,14,1)/MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)/10,0);
 
      if(iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)<
         iOpen(SymbolName(int(array[y][0]),true),PERIOD_D1,0))
         array[y][FindNumTab(HeadName)]*=-1;

    }
 }
 
//+------------------------------------------------------------------+
//| HHLL                                                                 |
//+------------------------------------------------------------------+
void HHLL(string HeadName)
  {
   for(int y=0;y<=rowsMW;y++)
     {

      array[y][FindNumTab(HeadName)]=NormalizeDouble(((iHigh(SymbolName(int(array[y][0]),true),PERIOD_D1,0)-
                                  iLow(SymbolName(int(array[y][0]),true),PERIOD_D1,0))/
                                  MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)/10),2);
      if(iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)<
         iOpen(SymbolName(int(array[y][0]),true),PERIOD_D1,0))
         array[y][FindNumTab(HeadName)]*=-1;
       
      array[y][FindNumTab(HeadName)]=NormalizeDouble(array[y][FindNumTab(HeadName)],0);


     }

  }
//+------------------------------------------------------------------+
//| CurrentPipsBarHHLL                                                                 |
//+------------------------------------------------------------------+  
void CurrentPipsBarHHLL(string HeadName)
{
   for(int y=0;y<=rowsMW;y++)
     {
      array[y][FindNumTab(HeadName)]=NormalizeDouble(((iHigh(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,0)-
                                                       iLow(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,0))/
                                                       MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)/10),0);
                                                       
      if(iClose(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,0)<iOpen(SymbolName((int(array[y][0])),true),PERIOD_CURRENT,0))    
         array[y][FindNumTab(HeadName)]*=-1;                                          
     }
}

//+------------------------------------------------------------------+
//| CurrentPfromHHLL                                                                 |
//+------------------------------------------------------------------+
void CurrentPfromHHLL(string HeadName)
{
   for(int y=0;y<=rowsMW;y++)
     {
 
           if(iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)<
              iOpen(SymbolName(int(array[y][0]),true),PERIOD_D1,0))
 
                       array[y][FindNumTab(HeadName)]=NormalizeDouble(((iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)-
                                                                   iLow(SymbolName(int(array[y][0]),true),PERIOD_D1,0))/
                                                                   MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)/-10),0);
            else
                       array[y][FindNumTab(HeadName)]=NormalizeDouble(((iHigh(SymbolName(int(array[y][0]),true),PERIOD_D1,0)-
                                                                   iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0))/
                                                                   MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)/10),0);
     }
}
//+------------------------------------------------------------------+
//| SuperTrendBoard                                                                 |
//+------------------------------------------------------------------+
void SuperTrendBoard(string HeadName)
 {
 
for(int y=0;y<=rowsMW;y++)
  {
double H=0,L=0,SH=0,SHbar=0,SL=0,SLbar=0,counter=0,pipsCorrectipn=0;
int Hbar=0,Lbar=0;
pipsCorrectipn=200*MarketInfo(SymbolName(y,true),MODE_POINT)*10;
   for(int bar=0;bar<100000;bar++)
          {

            if(H<iHigh(SymbolName(y,true),PERIOD_H4,bar))
             {
        
              H       =iHigh(SymbolName(y,true),PERIOD_H4,bar);
              Hbar   =bar;
              SL      =iLow(SymbolName(y,true),PERIOD_H4,bar);
              SLbar  =bar;
             }
            if(L>iLow(SymbolName(y,true),PERIOD_H4,bar) || L==0)
             {
              L       =iLow(SymbolName(y,true),PERIOD_H4,bar);
              Lbar   =bar;
              SH      =iHigh(SymbolName(y,true),PERIOD_H4,bar);
              SHbar  =bar;
             }
      
           if(counter==0)
            {
             if(H-L>pipsCorrectipn && H!=0 && L!=0)
              {
               counter=(H-L)*MarketInfo(SymbolName(y,true),MODE_POINT) /10;
               if(Hbar>Lbar)
                 counter*=-1;          
               }
             }
            else
              {
 
               if(counter!=0)
                {
                 if(SH<iHigh(SymbolName(y,true),PERIOD_H4,bar))
                   {
                     SH      =iHigh(SymbolName(y,true),PERIOD_H4,bar);
                     SHbar  =bar;
                    }
                 if(SL>iLow(SymbolName(y,true),PERIOD_H4,bar))
                   {
                     SL      =iLow(SymbolName(y,true),PERIOD_H4,bar);
                     SLbar  =bar;
                    }
                 if( (SH-L>pipsCorrectipn && counter>0) || (H-SL>pipsCorrectipn && counter<0) )
                   {
                    array[y][FindNumTab(HeadName)]=(H-L)/MarketInfo(SymbolName(y,true),MODE_POINT)/10;
                    array[y][FindNumTab(HeadName)]=NormalizeDouble(array[y][FindNumTab(HeadName)],2);
                    if(counter<0)
                      {
                       array[y][FindNumTab(HeadName)]*=-1;
                       DepperCorrection(Hbar,counter,y,"DepperCorrec");
                       }
                     else
                       DepperCorrection(Lbar,counter,y,"DepperCorrec");
                     bar=1000000;
                   }
                }
              }
          }
        
      //array[y][FindNumTab(HeadName)]=NormalizeDouble(array[y][FindNumTab(HeadName)],0);
      }
 }
//+------------------------------------------------------------------+
//| LotSumAccounts                                                                 |
//+------------------------------------------------------------------+
void LotSumAccounts(string HeadName)
     {
int            count = 0,NewLine=0,Line=0;
string         ListSymbols;
string         FileName = "CCIRSIdata.csv";
int            handle=FileOpen(FileName,FILE_CSV|FILE_READ|FILE_WRITE,","); 
string vars[1000]; 
 
 
   while (!FileIsEnding(handle))// && count < 999)
   {
     if(NewLine==2)
       {
       ListSymbols=StringConcatenate(ListSymbols,"\n");
       NewLine=0;
       Line++;
       }
      
      vars[count] = FileReadString(handle);
      ListSymbols=StringConcatenate(ListSymbols,vars[count]+"  ");
 
      OpenOrderData[Line][NewLine]=vars[count];
 
      count++;
      NewLine++;
   }
 
   FileClose(handle);
if(count!=0)
 {
 
   ArrayResize(OpenOrderData,(count/NewLine));
  int w=1;
if((count/NewLine)-1>0)
 for(;w<=(count/NewLine)-1;w++)
    {
     for(int y=0;y<=rowsMW+1;y++)
        {
         if((OpenOrderData[w][0]==SymbolName(y,true) ))
           {
            array[y][FindNumTab(HeadName)]=double(OpenOrderData[w][1]);
            array[y][FindNumTab(HeadName)]*=100;
            array[y][FindNumTab(HeadName)]=NormalizeDouble(array[y][FindNumTab(HeadName)],2);
           }
        }
      }
   }
}
//+------------------------------------------------------------------+
//| DepperCorrection                                                                 |
//+------------------------------------------------------------------+
void DepperCorrection(int HLbar,double trend,int  symbol, string HeadName)
{

  int H1bar=0,H2bar=0,L1bar=0,L2bar=0;
  double deeperCorrec=0;
 
for(int bar=HLbar;bar>0;bar--)
   {
   

   
//---For Up
    if(trend > 0)
          {
          if(iHigh(SymbolName(symbol,true),PERIOD_H4,  H1bar)<
             iHigh(SymbolName(symbol,true),PERIOD_H4,bar )  ||  H1bar==0 )
             {
             
               H2bar=H1bar;
               H1bar= bar;
          
             }
          
           if(H2bar!=0)
              {
                if(deeperCorrec*-1<iHigh(SymbolName(symbol,true),PERIOD_H4,  H2bar)-
                   iLow(SymbolName(symbol,true),PERIOD_H4,iLowest(SymbolName(symbol,true),PERIOD_H4,MODE_LOW,((H2bar-H1bar)+1), H1bar))       )
                   {
                    deeperCorrec=(iHigh(SymbolName(symbol,true),PERIOD_H4,  H2bar)-
                    iLow(SymbolName(symbol,true),PERIOD_H4,iLowest(SymbolName(symbol,true),PERIOD_H4,MODE_LOW,((H2bar-H1bar)+1), H1bar))     )*-1;

                   }
              }

           }
//---For Down
    if(trend < 0)
      {
          if(iLow(SymbolName(symbol,true),PERIOD_H4,  L1bar)>
             iLow(SymbolName(symbol,true),PERIOD_H4,bar)  || L1bar==0  )
             {
               L2bar=L1bar;
               L1bar= bar;
             }
          
           if(L2bar!=0)
              {
                if(deeperCorrec<iHigh(SymbolName(symbol,true),PERIOD_H4,iHighest(SymbolName(symbol,true),PERIOD_H4,MODE_HIGH,((L2bar-L1bar)+1), L1bar))-
                   iLow(SymbolName(symbol,true),PERIOD_H4,  L2bar)   )
                   {
                    deeperCorrec=(iHigh(SymbolName(symbol,true),PERIOD_H4,iHighest(SymbolName(symbol,true),PERIOD_H4,MODE_HIGH,((L2bar-L1bar)+1), L1bar))-
                    iLow(SymbolName(symbol,true),PERIOD_H4,  L2bar));              
                   }
              }
      }
   }
 

//---For UP
   if(trend > 0)
     {
      PFromSuperTrend(H1bar,trend,symbol, "PFromSupTren");
      if(deeperCorrec*-1<iHigh(SymbolName(symbol,true),PERIOD_H4,  H1bar)-
         iLow(SymbolName(symbol,true),PERIOD_H4,iLowest(SymbolName(symbol,true),PERIOD_H4,MODE_LOW,(H2bar+1), 0))       )
        {
         deeperCorrec=(iHigh(SymbolName(symbol,true),PERIOD_H4,  H1bar)-
         iLow(SymbolName(symbol,true),PERIOD_H4,iLowest(SymbolName(symbol,true),PERIOD_H4,MODE_LOW,(H2bar+1), 0))    )*-1 ;
        } 
      }
//---For Down
   if(trend<0)
     {
      PFromSuperTrend(L1bar,trend,symbol, "PFromSupTren");
      if(deeperCorrec<iHigh(SymbolName(symbol,true),PERIOD_H4,iHighest(SymbolName(symbol,true),PERIOD_H4,MODE_HIGH,(L1bar+1), 0))-
         iLow(SymbolName(symbol,true),PERIOD_H4,  L1bar)       )
        {
         deeperCorrec=(iHigh(SymbolName(symbol,true),PERIOD_H4,iHighest(SymbolName(symbol,true),PERIOD_H4,MODE_HIGH,(L1bar+1), 0))-
         iLow(SymbolName(symbol,true),PERIOD_H4,  L1bar));
        }      
      }
   array[symbol][FindNumTab(HeadName)]=deeperCorrec/MarketInfo(SymbolName(symbol,true),MODE_POINT)/10;
   array[symbol][FindNumTab(HeadName)]=NormalizeDouble(array[symbol][FindNumTab(HeadName)],0);    
   array[symbol][FindNumTab(HeadName)]*=-1;
}
//+------------------------------------------------------------------+
//| PFromSuperTrend                                                                 |
//+------------------------------------------------------------------+
void PFromSuperTrend(int HLbar,double trend,int symbol,string HeadName)
{
  if(trend>0)
    {
     if(HLbar==1)
       if(iHigh(SymbolName(symbol,true),PERIOD_H4,HLbar)<iHigh(SymbolName(symbol,true),PERIOD_H4,0))
         HLbar=0;
     
     array[symbol][FindNumTab(HeadName)]=NormalizeDouble(
                                           (iHigh(SymbolName(symbol,true),PERIOD_H4,HLbar)-
                                            iClose(SymbolName(symbol,true),PERIOD_H4,0))/
                                            10/MarketInfo(SymbolName(symbol,true),MODE_POINT)    
                                            ,0);
    }

  else
    if(trend<0)
      {
       if(iLow(SymbolName(symbol,true),PERIOD_H4,HLbar)>iLow(SymbolName(symbol,true),PERIOD_H4,0))
         HLbar=0;
     

       array[symbol][FindNumTab(HeadName)]=NormalizeDouble(
                                            ((iClose(SymbolName(symbol,true),PERIOD_H4,0))-
                        
                        
                                            iLow(SymbolName(symbol,true),PERIOD_H4,HLbar))/
                                            -10/MarketInfo(SymbolName(symbol,true),MODE_POINT)    
                                            ,0);    
      }
}

//+------------------------------------------------------------------+
//|ThreeAm                                                                  |
//+------------------------------------------------------------------+
void ThreeAm(string HeadName)
{
double time=EMPTY_VALUE;
int DBar;
for(int y=0;y<=rowsMW;y++)
   {
      DBar=iBarShift(SymbolName(int(array[y][0]),true),PERIOD_M5, iTime(SymbolName(int(array[y][0]),true),PERIOD_D1,0) ,false);
      time=EMPTY_VALUE;
  for(int bar=DBar;bar>=0;bar--)
    {

   if((iHigh(SymbolName(int(array[y][0]),true),PERIOD_M5,bar)>=iHigh(SymbolName(int(array[y][0]),true),PERIOD_D1,1) || iLow(SymbolName(int(array[y][0]),true),PERIOD_M5,bar)<=iLow(SymbolName(int(array[y][0]),true),PERIOD_D1,1) ))
     {
       if(time==EMPTY_VALUE)
         {
           {
            time=StrToDouble(StringSubstr(TimeToStr(iTime(SymbolName(int(array[y][0]),true),PERIOD_M5,bar),TIME_MINUTES),0,2));
           }
         }
       else
         {
         if(time!=EMPTY_VALUE && time<0.03 && TimeToStr(iTime(SymbolName(int(array[y][0]),true),PERIOD_M5,bar),TIME_MINUTES)>"03:00")
           { 

            time=(time+StrToDouble(StringSubstr(TimeToStr(iTime(SymbolName(int(array[y][0]),true),PERIOD_M5,bar),TIME_MINUTES),0,2))*100);

            bar=0;
           }
         }
      }
       
       if(bar==0 && time!=EMPTY_VALUE)
         if(iClose(SymbolName(int(array[y][0]),true),PERIOD_D1,0)<iOpen(SymbolName(int(array[y][0]),true),PERIOD_D1,0))
            time*=-1;            
         
    }
      array[y][FindNumTab(HeadName)]=NormalizeDouble(time,2);

   }
}



//+------------------------------------------------------------------+
//|BBBasic                                                                  |
//+------------------------------------------------------------------+
double BBBasic(int symbol,double BBrange)
  {
   double divetionUp=iLow(SymbolName(int(array[symbol][0]),true),PERIOD_M5,1)-iBands(SymbolName(int(array[symbol][0]),true),PERIOD_M5,20,1,0,PRICE_WEIGHTED,MODE_UPPER,1);
   double divetionDown=iBands(SymbolName(int(array[symbol][0]),true),PERIOD_M5,20,1,0,PRICE_WEIGHTED,MODE_LOWER,1)-iHigh(SymbolName(int(array[symbol][0]),true),PERIOD_M5,1);
   if(divetionUp>BBrange && divetionUp>0 && iClose(SymbolName(int(array[symbol][0]),true),PERIOD_M5,0)>iBands(SymbolName(int(array[symbol][0]),true),PERIOD_M5,20,1,0,PRICE_WEIGHTED,MODE_UPPER,0))
     {
      //return 1;
      return divetionUp;
     }
   else
    if(divetionDown>BBrange && divetionDown>0  && iBands(SymbolName(int(array[symbol][0]),true),PERIOD_M5,20,1,0,PRICE_WEIGHTED,MODE_LOWER,0)>iClose(SymbolName(int(array[symbol][0]),true),PERIOD_M5,0))
      {
       //return -1;
       return divetionDown*-1;
      }
   return 0;
  }
//+------------------------------------------------------------------+
//| BBtable                                                                 |
//+------------------------------------------------------------------+
void BBtable(string HeadName1,string HeadName2,string HeadName3,string HeadName4)
  {
   double sum,divetionUp,divetionDown;
   for(int y=0;y<=rowsMW;y++)
     {
      array[y][FindNumTab(HeadName1)]=iATR(SymbolName(int(array[y][0]),true),PERIOD_M5,14,1);//BBBasic(y,iATR(SymbolName(int(array[y][0]),true),PERIOD_M5,14,1));
      if(array[y][FindNumTab(HeadName1)]!=0)
          array[y][FindNumTab(HeadName1)]=NormalizeDouble((array[y][FindNumTab(HeadName1)]/10/MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)),0);

      divetionUp=iLow(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,1)-iBands(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,14,1,0,PRICE_WEIGHTED,MODE_UPPER,1);
      divetionDown=iBands(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,20,1,0,PRICE_WEIGHTED,MODE_LOWER,1)-iHigh(SymbolName(int(array[y][0]),true),PERIOD_CURRENT,1);

      if(divetionUp>0)
        array[y][FindNumTab(HeadName4)]=divetionUp;
      else
       if(divetionDown>0)
          array[y][FindNumTab(HeadName4)]=divetionDown*-1;

      if(array[y][FindNumTab(HeadName4)]!=0)
        array[y][FindNumTab(HeadName4)]=NormalizeDouble((array[y][FindNumTab(HeadName4)]/10/MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)),0);

      sum=0;
//---Finding Mean
         double ArrayBBspread[15];
         
         for(int bar=1,i=0;i<14;bar++)
           {

            divetionUp=iLow(SymbolName(int(array[y][0]),true),PERIOD_M5,bar)-iBands(SymbolName(int(array[y][0]),true),PERIOD_M5,14,1,0,PRICE_WEIGHTED,MODE_UPPER,bar);
            divetionDown=iBands(SymbolName(int(array[y][0]),true),PERIOD_M5,20,1,0,PRICE_WEIGHTED,MODE_LOWER,bar)-iHigh(SymbolName(int(array[y][0]),true),PERIOD_M5,bar);
     
     
            if(divetionUp>0)
              {
               sum=sum+divetionUp;
               ArrayBBspread[i]=divetionUp;
               
               i++;
              }
           
            else
            if(divetionDown>0)
              {
               sum=sum+divetionDown;
               ArrayBBspread[i]=divetionDown;
               i++;
              }

            }
   if(sum!=0)
     {
      sum/=14;
      array[y][FindNumTab(HeadName2)]=NormalizeDouble((sum/10/MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)),1);  
     }

//---Finding Deviation
     int SizeArrayBBspread=ArraySize(ArrayBBspread);
     ArrayResize(ArrayBBspread,SizeArrayBBspread+1);
     double sumDiv=0;
     int DivCount=0;
     for(int a=SizeArrayBBspread;a>=0;a--)
        {
         if(ArrayBBspread[a]>sum)
           {
            sumDiv+=(ArrayBBspread[a]-sum);
            DivCount++;
           }
        }
         
     if(sumDiv!=0)
       {
        array[y][FindNumTab(HeadName3)]=NormalizeDouble((sumDiv/DivCount/10/MarketInfo(SymbolName(int(array[y][0]),true),MODE_POINT)),1);
       }
     }
  }

//+------------------------------------------------------------------+
//|FindNumTab                                                                  |
//+------------------------------------------------------------------+
int FindNumTab(string headL)
{
  for(int h=tab-1;h>=0;h--)
    {
     if(headL==DicrionaryArray[h])
       return h;
    }
  
  return 0;
}

//+------------------------------------------------------------------+
//| Magafon                                                                 |
//+------------------------------------------------------------------+
void Magafon(string HeadName)
{
    for(int y=0;y<=rowsMW;y++)
     {
      int bar=iBarShift(SymbolName(y,true),PERIOD_M5,iTime(SymbolName(y,true),PERIOD_D1,0), false);
      for(int b=bar-1;b>=0;b--)
         { 
//---For Up
          if(iHigh(SymbolName(y,true),PERIOD_M5,b)==iHigh(SymbolName(y,true),PERIOD_M5,iHighest(SymbolName(y,true),PERIOD_M5,MODE_HIGH,((bar-b)+1),b)))
            {
             if(array[y][FindNumTab(HeadName)]==0)
               {
                 array[y][FindNumTab(HeadName)]++;
               }
             else
               if(array[y][FindNumTab(HeadName)]<0)
                 {
                  array[y][FindNumTab(HeadName)]=(array[y][FindNumTab(HeadName)]-1)*-1;
                 }
            }
//---For Down
          if(iLow(SymbolName(y,true),PERIOD_M5,b)==iLow(SymbolName(y,true),PERIOD_M5,iLowest(SymbolName(y,true),PERIOD_M5,MODE_LOW,((bar-b)+1),b)))
            {
             if(array[y][FindNumTab(HeadName)]==0)
               {
                 array[y][FindNumTab(HeadName)]--;  
               }
             else
               if(array[y][FindNumTab(HeadName)]>0)
                 {
                  array[y][FindNumTab(HeadName)]=(array[y][FindNumTab(HeadName)]+1)*-1;
                 }
            }
         }
     }
}
//+------------------------------------------------------------------+
//| sDividedD                                                                 |
//+------------------------------------------------------------------+

void sDividedD(string HeadName)
{
    for(int y=0;y<=rowsMW;y++)
     {
     if(array[y][FindNumTab("DepperCorrec")]!=0 && array[y][FindNumTab("Sup.TrendBoar")]!=0)
        array[y][FindNumTab(HeadName)]=array[y][FindNumTab("DepperCorrec")]/array[y][FindNumTab("Sup.TrendBoar")]*100;
        
      array[y][FindNumTab(HeadName)]=NormalizeDouble(array[y][FindNumTab(HeadName)],0);

     }
}