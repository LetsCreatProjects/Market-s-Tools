//+------------------------------------------------------------------+
//|                                      WinnerUpDown28072020Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      WinnerUpDown13112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      WinnerUpDown09112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      WinnerUpDown08112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      WinnerUpDown07112018Ind.mq4 |
//|                        Copyright 2017, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_chart_window

int rowsOfCurrency=10,tabForW=10;
int rowsMW=SymbolsTotal(true)-1;//rows
    static int county=0;
string CurrencyName[]=
   {"AUD",
    "CAD",
    "CHF",
    "EUR",
    "JPY",
    "NZD",
    "GBP",
    "USD",
    "SGD"
   },
   
DicrionaryForWinArray[]=
{
  "Curr.",
  "Max%*100",
  "%*100",
  "MaxP",
  "Pips"
};   

double arrayWinnerTaleCurrency[100][100],arrayWinnerTaleSymbol[100][100];
int    winnerRowCurrency,winnerRowSymbols;

double arrayWinnerTaleIntA,arrayWinnerTaleIntB,arrayWinnerTaleIntC,arrayWinnerTaleIntD;

double sumOfCurrency[10];

    static int spradBetweenTabs=50,PutDownBy=3,NewRightRow=0,PutDown1,PutDown2=0,countyForRightTabs;
    int countC;
    
//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- indicator buffers mapping
Comment("                                                                                                      "+WindowExpertName());

    
    rowsOfCurrency=ArraySize(CurrencyName)-1;
    tabForW      =ArraySize(DicrionaryForWinArray);
    ArrayResize(arrayWinnerTaleCurrency,rowsOfCurrency+1);
    mainWinner();
    
//---Tanble For Currency
    DrawCurrencyTable(); 
       
//---Tanble For Symnols
    DrawSymbolTable();

//---
   return(INIT_SUCCEEDED);
  }
  
//+------------------------------------------------------------------+
//| Deinit                                                                 |
//+------------------------------------------------------------------+  
void Deinit()
{
    ObjectsDeleteAll();
}  
//+------------------------------------------------------------------+
//|  DrawCurrencyTable                                               |
//+------------------------------------------------------------------+
void DrawCurrencyTable()
{
 int PutRigh=21,PutDownBy3=1;
 for(int headline=0; headline<=tabForW-1;headline++)

     {
      ObjectCreate (0,IntegerToString(headline),OBJ_LABEL,0,0,0);
      ObjectSet    (IntegerToString(headline),OBJPROP_XDISTANCE,(PutRigh+0.1+headline)*spradBetweenTabs);
      ObjectSet    (IntegerToString(headline),OBJPROP_YDISTANCE,(PutDownBy3+PutDownBy-1)*15);
      ObjectSetText(IntegerToString(headline),DicrionaryForWinArray[headline],7,"Arial Bold",clrPurple);
     }

 
  for(int y=0;y<winnerRowCurrency;y++)
      {

      ObjectCreate (0,DoubleToStr(arrayWinnerTaleCurrency[y][0])+"a",OBJ_LABEL,0,0,0);
      ObjectSet    (DoubleToStr(arrayWinnerTaleCurrency[y][0])+"a",OBJPROP_XDISTANCE, (PutRigh+0.2)*50);
      ObjectSet    (DoubleToStr(arrayWinnerTaleCurrency[y][0])+"a", OBJPROP_YDISTANCE,(PutDownBy3+PutDownBy+y)*15);
      ObjectSetText(DoubleToStr(arrayWinnerTaleCurrency[y][0])+"a",CurrencyName[y],7,"Arial Bold",clrPurple);      
      
      
  int x=1;
     for(;x<=tabForW-1;x++)
        {

         ObjectCreate (0,IntegerToString(x)+","+IntegerToString(y)+"b",OBJ_LABEL,0,0,0);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"b",OBJPROP_XDISTANCE,(PutRigh+0.2+x)*spradBetweenTabs);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"b",OBJPROP_YDISTANCE,(PutDownBy3+PutDownBy+y)*15);
         ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"b",string(arrayWinnerTaleCurrency[y][x]),7,"Time New Roman",clrPurple);
         
         sumOfCurrency[x]+=arrayWinnerTaleCurrency[y][x];
         
         if(x==1 || x==2)
           ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"c",string(arrayWinnerTaleCurrency[y][x])+"%",7,"Time New Roman",clrPurple);
           
        if(y==winnerRowCurrency-1)
           {
            ObjectCreate (0,IntegerToString(x)+","+IntegerToString(y)+"Total",OBJ_LABEL,0,0,0);
            ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"Total",OBJPROP_XDISTANCE,(PutRigh+0.2+x)*spradBetweenTabs);
            ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"Total",OBJPROP_YDISTANCE,(PutDownBy3+PutDownBy+1+y)*15);
            ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"Total",string(sumOfCurrency[x]),8,"Arial Bold",clrPurple);
            
            if(x==1 || x==2)
               ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"Total",string(sumOfCurrency[x])+"%",8,"Arial Bold",clrPurple);
               
            sumOfCurrency[x]=0;
           }    
         
         }
  }
}  
//+------------------------------------------------------------------+
//|  DrawSymbolTable                                                                |
//+------------------------------------------------------------------+
void DrawSymbolTable()
{
 for(int headline=0; headline<=tabForW-1;headline++)

     {
      ObjectCreate (0,IntegerToString(headline)+"sH",OBJ_LABEL,0,0,0);
      ObjectSet    (IntegerToString(headline)+"sH",OBJPROP_XDISTANCE,(0.1+headline)*spradBetweenTabs);
      ObjectSet    (IntegerToString(headline)+"sH",OBJPROP_YDISTANCE,(PutDownBy-1)*15);
      ObjectSetText(IntegerToString(headline)+"sH",string(DicrionaryForWinArray[headline]),7,"Arial Bold",clrBlack);
     }

  for(int y=0;y<winnerRowSymbols;y++)
      {
      ObjectCreate (0,SymbolName(int(arrayWinnerTaleSymbol[y][0]),true)+string(arrayWinnerTaleSymbol[y][0])+"s"+string(y),OBJ_LABEL,0,0,0);
      ObjectSet    (SymbolName(int(arrayWinnerTaleSymbol[y][0]),true)+string(arrayWinnerTaleSymbol[y][0])+"s"+string(y),OBJPROP_XDISTANCE, (0.2+NewRightRow)*50);
      ObjectSet    (SymbolName(int(arrayWinnerTaleSymbol[y][0]),true)+string(arrayWinnerTaleSymbol[y][0])+"s"+string(y), OBJPROP_YDISTANCE,(PutDownBy+PutDown1+PutDown2)*15);
      double           nameS=arrayWinnerTaleSymbol[y][0];
      ObjectSetText(SymbolName(int(arrayWinnerTaleSymbol[y][0]),true)+string(arrayWinnerTaleSymbol[y][0])+"s"+string(y),SymbolName(int(arrayWinnerTaleSymbol[y][0]),true),7,"Arial Bold",clrNavy);

     for(int x=1;x<=tabForW-1;x++)
        {

         ObjectCreate (0,IntegerToString(x)+","+IntegerToString(y)+"s",OBJ_LABEL,0,0,0);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"s",OBJPROP_XDISTANCE,(0.2+x+NewRightRow)*spradBetweenTabs);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"s",OBJPROP_YDISTANCE,(PutDownBy+PutDown1+PutDown2)*15);
         ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"s",string(arrayWinnerTaleSymbol[y][x]),7,"Time New Roman",clrBlack);
         
         if(x==1 || x==2)
           ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"s",string(arrayWinnerTaleSymbol[y][x])+"%",7,"Time New Roman",clrBlack);
         }
     if(arrayWinnerTaleSymbol[y][1]<0)
        ObjectSetText(SymbolName(int(arrayWinnerTaleSymbol[y][0]),true)+string(arrayWinnerTaleSymbol[y][0])+"s"+string(y),SymbolName(int(arrayWinnerTaleSymbol[y][0]),true),7,"Arial Bold",clrMaroon);

     if(arrayWinnerTaleSymbol[y][5]==55555)
       {
      int           nameC=int(arrayWinnerTaleCurrency[countC][0]);
      ObjectCreate (0,CurrencyName[nameC]+"ct",OBJ_LABEL,0,0,0);
      ObjectSet    (CurrencyName[nameC]+"ct",OBJPROP_XDISTANCE,  (0.2+NewRightRow)*50);
      ObjectSet    (CurrencyName[nameC]+"ct", OBJPROP_YDISTANCE,(PutDownBy+1+PutDown1+PutDown2)*15);
      ObjectSetText(CurrencyName[nameC]+"ct",CurrencyName[nameC],8,"Arial Bold",clrBlack);       
             
     for(int x=1;x<=tabForW-1;x++)
        {
         ObjectCreate (0,IntegerToString(x)+","+IntegerToString(y)+"ct",OBJ_LABEL,0,0,0);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"ct",OBJPROP_XDISTANCE,(0.2+x+NewRightRow)*spradBetweenTabs);
         ObjectSet    (IntegerToString(x)+","+IntegerToString(y)+"ct",OBJPROP_YDISTANCE,(PutDownBy+1+PutDown1+PutDown2)*15);
         ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"ct",string(arrayWinnerTaleCurrency[countC][x]),8,"Arial Bold",clrBlack);
        
         if(x==1 || x==2)
            ObjectSetText(IntegerToString(x)+","+IntegerToString(y)+"ct",string(arrayWinnerTaleCurrency[countC][x])+"%",8,"Arial Bold",clrBlack);
        
        }
        
        PutDown2+=3;
        countyForRightTabs++;
        countC++;
       }
     if(countyForRightTabs==2)
       {
        NewRightRow+=5;
        countyForRightTabs=0;
        PutDownBy=2;
        PutDown1=0;
        PutDown2=0;

       }
      PutDown1++;   
    }   
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
//|                                                                  |
//+------------------------------------------------------------------+
void mainWinner()
{

  for(int c=0;c<=rowsOfCurrency;c++)
     {
     
      arrayWinnerTaleCurrency[winnerRowCurrency][0]=winnerRowCurrency;
      winnerRowCurrency++;
      for(int y=0;y<=rowsMW;y++)
         {
          if(StringSubstr(SymbolName(y,true),0,3)== CurrencyName[winnerRowCurrency-1] || StringSubstr(SymbolName(y,true),3,3)== CurrencyName[winnerRowCurrency-1] )
            {
             arrayWinnerTaleSymbol[winnerRowSymbols][0]=y;
             GetSymbolData(SymbolName(y,true),CurrencyName[winnerRowCurrency-1],winnerRowSymbols);
             
             winnerRowSymbols++; 

            }
         }
       arrayWinnerTaleSymbol[winnerRowSymbols-1][5]=55555;
     }
  CurrencyTotal();
}
//+------------------------------------------------------------------+
//|   CurrencyTotal                                                               |
//+------------------------------------------------------------------+
void CurrencyTotal()
   {
       int y1=0;
       for(int y2=0;y2<=winnerRowSymbols;y2++)
          {
           arrayWinnerTaleIntA+=arrayWinnerTaleSymbol[y2][1];
           arrayWinnerTaleIntB+=arrayWinnerTaleSymbol[y2][2];
           arrayWinnerTaleIntC+=arrayWinnerTaleSymbol[y2][3];
           arrayWinnerTaleIntD+=arrayWinnerTaleSymbol[y2][4];  

           if(arrayWinnerTaleSymbol[y2][5]==55555)
             {
            arrayWinnerTaleCurrency[y1][1]=NormalizeDouble(arrayWinnerTaleIntA,0);
            arrayWinnerTaleCurrency[y1][3]=NormalizeDouble(arrayWinnerTaleIntB,0);//take notes that number has been switched
            arrayWinnerTaleCurrency[y1][2]=NormalizeDouble(arrayWinnerTaleIntC,0);//take notes that number has been switched
            arrayWinnerTaleCurrency[y1][4]=NormalizeDouble(arrayWinnerTaleIntD,0);   
            
            arrayWinnerTaleIntA=0;
            arrayWinnerTaleIntB=0;
            arrayWinnerTaleIntC=0;
            arrayWinnerTaleIntD=0;                   
             
             y1++;
             }          
          }
   }
 
//+------------------------------------------------------------------+
//| GetSymbolData                                                                 |
//+------------------------------------------------------------------+
void GetSymbolData(string symbol,string currency,int RowSymbols)
    {

//---
           if(StringSubstr(symbol,0,3)== currency && iClose(symbol,PERIOD_CURRENT,0) > iOpen(symbol,PERIOD_CURRENT,0))
             {
              arrayWinnerTaleIntA=(iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000;
              arrayWinnerTaleIntB=(iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0));
              arrayWinnerTaleIntC=(iClose(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000;
              arrayWinnerTaleIntD=(iClose(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0));
             }
             
//---
           else
            if(StringSubstr(symbol,3,3)== currency && iClose(symbol,PERIOD_CURRENT,0) < iOpen(symbol,PERIOD_CURRENT,0))
              {
               arrayWinnerTaleIntA=(iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000;
               arrayWinnerTaleIntB=(iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0));
               arrayWinnerTaleIntC=(iHigh(symbol,PERIOD_CURRENT,0)-iClose(symbol,PERIOD_CURRENT,0))*10000;
               arrayWinnerTaleIntD=(iHigh(symbol,PERIOD_CURRENT,0)-iClose(symbol,PERIOD_CURRENT,0));            
              }
//---
             else
              if(StringSubstr(symbol,0,3)== currency && iClose(symbol,PERIOD_CURRENT,0) < iOpen(symbol,PERIOD_CURRENT,0))
               {
                 arrayWinnerTaleIntA=((iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000)*-1;
                 arrayWinnerTaleIntB=((iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0)))*-1;
                 arrayWinnerTaleIntC=((iHigh(symbol,PERIOD_CURRENT,0)-iClose(symbol,PERIOD_CURRENT,0))*10000)*-1;
                 arrayWinnerTaleIntD=((iHigh(symbol,PERIOD_CURRENT,0)-iClose(symbol,PERIOD_CURRENT,0)))*-1;                         
             
               }
//---
              else
               if(StringSubstr(symbol,3,3)== currency && iClose(symbol,PERIOD_CURRENT,0) > iOpen(symbol,PERIOD_CURRENT,0))
                 {
                  arrayWinnerTaleIntA=((iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000)*-1;
                  arrayWinnerTaleIntB=((iHigh(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0)))*-1;
                  arrayWinnerTaleIntC=((iClose(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0))*10000)*-1;
                  arrayWinnerTaleIntD=((iClose(symbol,PERIOD_CURRENT,0)-iLow(symbol,PERIOD_CURRENT,0)))*-1;
                 }
//---

              if(iClose(symbol,PERIOD_CURRENT,1)!=0)
                {
                 arrayWinnerTaleSymbol[RowSymbols][1]=NormalizeDouble(arrayWinnerTaleIntA/iClose(symbol,PERIOD_CURRENT,1),0);
                 arrayWinnerTaleSymbol[RowSymbols][2]=NormalizeDouble(arrayWinnerTaleIntC/iClose(symbol,PERIOD_CURRENT,1),0);
                }
                
              if(MarketInfo(symbol,MODE_POINT)!=0)
                {
                 arrayWinnerTaleSymbol[RowSymbols][3]=NormalizeDouble(arrayWinnerTaleIntB/10/MarketInfo(symbol,MODE_POINT),0);
                 arrayWinnerTaleSymbol[RowSymbols][4]=NormalizeDouble(arrayWinnerTaleIntD/10/MarketInfo(symbol,MODE_POINT),0);
                }
    }    

//+------------------------------------------------------------------+
//| ChartEvent function                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)    
    
{    
    for(int headline=0; headline<=tabForW-1;headline++)
     {
      if(sparam==IntegerToString(headline))
        {
         ObjectsDeleteAll(1);
         ArrayTwist(headline);
         ArraySort(arrayWinnerTaleCurrency,0,0,MODE_DESCEND);
         ArrayTwist(headline);
         DrawCurrencyTable(); 
        }
     }    
  }  
//+------------------------------------------------------------------+
//| ArrayTwist                                                      |
//+------------------------------------------------------------------+
void ArrayTwist(int headL)
  {
   double arrTwist[100];
 
   for(int y=0;y<=rowsOfCurrency;y++)
     {
      arrTwist[y]=arrayWinnerTaleCurrency[y][0];
      arrayWinnerTaleCurrency[y][0]=arrayWinnerTaleCurrency[y][headL];
      arrayWinnerTaleCurrency[y][headL]=arrTwist[y];

     }
  }    