//+------------------------------------------------------------------+
//|                        PatternFCFindeForCurrentSr28072020Ind.mq4 |
//+------------------------------------------------------------------+
//|                        PatternFCFindeForCurrentSr16022019Ind.mq4 |
//+------------------------------------------------------------------+
//|                        PatternFCFindeForCurrentSr14022019Ind.mq4 |
//+------------------------------------------------------------------+
//|                        PatternFCFindeForCurrentSr07022019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder19012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder18012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder16012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder15012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder10012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder09012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder07012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder06012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder05012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                   PatternFCFinder04012019Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder27122018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder26122018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder25122018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder24122018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder23122018ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder20122018ind.mq4 |
///+------------------------------------------------------------------+
//|                                     PatternFinder18122018ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder17122018ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder16122018Ind.mq4 |

//|                                     PatternFinder15122018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                     PatternFinder13122018Ind.mq4 |
//|                        Copyright 2017, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#property indicator_separate_window

#property indicator_buffers 17

#property indicator_color1 clrRed
#property indicator_color2 clrBlack
#property indicator_color3 clrDarkGreen
#property indicator_color4 clrIndigo
#property indicator_color5 clrDarkSlateGray  
#property indicator_color6 clrMidnightBlue
#property indicator_color7 clrRed  
#property indicator_color8 clrDeepPink
#property indicator_color9 clrDarkBlue  
#property indicator_color10 clrGreen 
#property indicator_color11 clrMediumBlue  
#property indicator_color12 clrSaddleBrown  

#property indicator_color13 clrGreen
#property indicator_color14 clrWhite

#property indicator_color15 clrRed
#property indicator_color16 clrWhite

#property indicator_width1 1
#property indicator_width2 1
#property indicator_width3 1
#property indicator_width4 1
#property indicator_width5 1
#property indicator_width6 1
#property indicator_width7 1
#property indicator_width8 1
#property indicator_width9 1
#property indicator_width10 1
#property indicator_width11 1
#property indicator_width12 2

#property indicator_width13 9
#property indicator_width14 9
#property indicator_width15 9
#property indicator_width16 9

#define RET_ERROR EMPTY
#define VAL_ERROR EMPTY_VALUE



int rowsMW=SymbolsTotal(true)-1;//rows
int enumPrioud[]={5,15,30,60};
//input string FileName="DataForPattern.txt";

int bingo;

 extern int howMuchBfromStart=20;
bool isTrue;
int       dividedBy=1;

int bigestCountArray,countArray;
string arrayFractalCandleCorr[1000][1000];
double arrayToBuffer[103][200];
double zeroPoint;
double mainChart[150];


extern int CandkeNumbersAfterPattern=1;
extern int shiftBarBackBy=1;
extern int candleToScan=150;
extern int candlesToCheck=4;
extern double minCorr=0.9;

                     double  vectorX[100] ;
                     double vectorY[100] ;
int tab,perioud;
double buffer0[150],buffer1[150],buffer2[150],buffer3[150], buffer4[150],buffer5[150],buffer6[150],buffer7[150],buffer8[150],buffer9[150],buffer10[150];
double bodyHighGreen[100],bodyLowGreen[100],  bodyHighRed[100],bodyLowRed[100] ;

string ButtonFC1="Fractal",ButtonFC2="Candles",ButtonFC3="Corr",ButtonFC4="All";
double spradBetweenTabsMainButtons=1;//,PutDownByMainButtons=1.9;
int FontSizeMainButtons=10;
int buttonsDown = 50;
string wichData;

string Button1="Visual",Button2="2Charts",Button3="A.Data",Button4="Table";
double PutDownByMainButtons=1.9;
//For main button creation
int spradBetweenTabs=75,PutDownBy=3;

//+------------------------------------------------------------------+
//| Custom indicator initialization function                         |
//+------------------------------------------------------------------+
int OnInit()
  {
  ObjectsDeleteAll();
  Comment("                                                                                                                                                                       "+WindowExpertName());

ArrayResize(vectorX,candlesToCheck );
ArrayResize(vectorX, candlesToCheck );
//---_

   SetIndexBuffer(0,buffer0);
   SetIndexArrow (0,117);
   SetIndexStyle (0,DRAW_LINE);
   
//----
   SetIndexBuffer(1,buffer1);
   SetIndexStyle (1,DRAW_LINE);
   SetIndexArrow (1,108);
//---
   SetIndexBuffer(2,buffer2);
   SetIndexArrow (2,117);
   SetIndexStyle (2,DRAW_LINE);
   
//----
   SetIndexBuffer(3,buffer3);
   SetIndexStyle (3,DRAW_LINE);
   SetIndexArrow (3,108);
//---
   SetIndexBuffer(4,buffer4);
   SetIndexArrow (4,117);
   SetIndexStyle (4,DRAW_LINE);
   
//----
   SetIndexBuffer(5,buffer5);
   SetIndexStyle (5,DRAW_LINE);
   SetIndexArrow (5,108);
//---
   SetIndexBuffer(6,buffer6);
   SetIndexArrow (6,117);
   SetIndexStyle (6,DRAW_LINE);
   
//----
   SetIndexBuffer(7,buffer7);
   SetIndexStyle (7,DRAW_LINE);
   SetIndexArrow (7,108);
//---
   SetIndexBuffer(8,buffer8);
   SetIndexArrow (8,117);
   SetIndexStyle (8,DRAW_LINE);
   
//----
   SetIndexBuffer(9,buffer9);
   SetIndexStyle (9,DRAW_LINE);
   SetIndexArrow (9,108);
//---
   SetIndexBuffer(10,buffer10);
   SetIndexStyle (10,DRAW_LINE);
   SetIndexArrow (10,108);
//---

   SetIndexBuffer(11,mainChart);
   SetIndexStyle(11,DRAW_LINE);


//--- indicator buffers Candle
   SetIndexBuffer(12,bodyHighGreen);
   SetIndexStyle(12,DRAW_HISTOGRAM);
   
   SetIndexBuffer(13,bodyLowGreen);
   SetIndexStyle(13,DRAW_HISTOGRAM);
//---
   SetIndexBuffer(14,bodyHighRed);
   SetIndexStyle(14,DRAW_HISTOGRAM);
   
   SetIndexBuffer(15,bodyLowRed);
   SetIndexStyle(15,DRAW_HISTOGRAM);


ObjectCreate("line",OBJ_VLINE,TIME_DATE,Time[howMuchBfromStart],High[howMuchBfromStart]);
ObjectSet("line",OBJPROP_STYLE,STYLE_DASH);
ObjectSet("line",OBJPROP_COLOR,clrBlack);

//---
ObjectCreate("line1",OBJ_VLINE,TIME_DATE,Time[84+14-candlesToCheck],High[84+14-candlesToCheck]);
ObjectSet("line1",OBJPROP_STYLE,STYLE_DASH);
ObjectSet("line1",OBJPROP_COLOR,clrBlack);  
  
//--- indicator buffers mapping
perioud=ArraySize(enumPrioud);
     
     
     
//-----
     ObjectCreate (ButtonFC1,OBJ_BUTTON,0,0,0);
     ObjectSet      (ButtonFC1,OBJPROP_XDISTANCE,(0.1)*spradBetweenTabsMainButtons);
     ObjectSet      (ButtonFC1,OBJPROP_YDISTANCE,1*buttonsDown);
     ObjectSetText(ButtonFC1,ButtonFC1,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC2,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC2,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC2,OBJPROP_YDISTANCE,2*buttonsDown);
     ObjectSetText(ButtonFC2,ButtonFC2,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC3,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC3,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC3,OBJPROP_YDISTANCE,3*buttonsDown);
     ObjectSetText(ButtonFC3,ButtonFC3,FontSizeMainButtons,"Time New Roman",clrGreen);  

     ObjectCreate (ButtonFC4,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC4,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC4,OBJPROP_YDISTANCE,4*buttonsDown);
     ObjectSetText(ButtonFC4,ButtonFC4,FontSizeMainButtons,"Time New Roman",clrGreen);  

   //  Main Button Creation
     ButtonMainBuilder();
     
     ObjectCreate (0,"HHLL",OBJ_LABEL,1,0,0);
     ObjectSet    ("HHLL",OBJPROP_XDISTANCE,(130)*spradBetweenTabsMainButtons);
     ObjectSet    ("HHLL",OBJPROP_YDISTANCE,(0.1)*15);

   
   return(INIT_SUCCEEDED);
  }
  //--------
void StartProcess()
{
cleanData();

ObjectCreate("line",OBJ_VLINE,TIME_DATE,Time[howMuchBfromStart],High[howMuchBfromStart]);
ObjectSet("line",OBJPROP_STYLE,STYLE_DASH);
ObjectSet("line",OBJPROP_COLOR,clrBlack);


//---
ObjectCreate("line1",OBJ_VLINE,TIME_DATE,Time[84+14-candlesToCheck],High[84+14-candlesToCheck]);
ObjectSet("line1",OBJPROP_STYLE,STYLE_DASH);
ObjectSet("line1",OBJPROP_COLOR,clrBlack);  
  
  

     //  for(int s=0;s<=rowsMW;s++)
         {
         for(int p=0;p<perioud;p++)
            {
         
        //  if(tab<1)
      //      {
             isTrue=DataInTab(tab,Symbol(),enumPrioud[p]);
             if(isTrue==true)
                tab++;
  //            }
            }
         }
DrawTable();
}
  
  
  
  
  //--------
  
void preparDataToDrawChart(int tab1)
{

int rows1=howMuchRows(tab1);
//Print(howMuchRows(tab1)+" ----preparDataToDrawChart------- tab1="+TimeCurrent()+"  "+tab1);

         for(int r2=0;r2<rows1;r2++)
            {
                
//---------------SplitString
int    iFirst     = StringFind( arrayFractalCandleCorr[r2][tab1], " "),
       iSecond = StringFind( arrayFractalCandleCorr[r2][tab1], " ", iFirst + 1);

string s      = StringSubstr( arrayFractalCandleCorr[r2][tab1], 0, iFirst);
int         p  = int(StringSubstr(arrayFractalCandleCorr[r2][tab1] , iFirst+1 , iSecond - iFirst - 1)),
         startB      = int(StringSubstr( arrayFractalCandleCorr[r2][tab1], iSecond + 1));
//---------------EndSplitString                 

dataToDrawChart(r2,s,p,startB); //dataToDrawChart(int wichChart,int s,int t,int bStart)      
                 
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
  //--------

void DrawLinesGraphs()
{
 //drawCandle(Symbol(),PERIOD_CURRENT,0,howMuchBfromStart,99);//2-PERIOD, Last-where to draw,4-take data from+candlesToCheck//
 //---   dataToDrawChart(r2,s,StringToInteger(p),StringToInteger(startB)); //dataToDrawChart(int wichChart,int s,int t,int bStart)      

for(int b=1;b<98;b++)
   {
   //Print("2-----"+arrayToBuffer[2][b]);
//   
//if(arrayToBuffer[0][b]!=arrayToBuffer[100][b])
   buffer0[b+shiftBarBackBy]=arrayToBuffer[0][b];
//if(arrayToBuffer[1][b]!=arrayToBuffer[100][b])
   buffer1[b+shiftBarBackBy]=arrayToBuffer[1][b];
//if(arrayToBuffer[2][b]!=arrayToBuffer[100][b])
   buffer2[b+shiftBarBackBy]=arrayToBuffer[2][b];
//if(arrayToBuffer[3][b]!=arrayToBuffer[100][b])
   buffer3[b+shiftBarBackBy]=arrayToBuffer[3][b];
//if(arrayToBuffer[4][b]!=arrayToBuffer[100][b])
   buffer4[b+shiftBarBackBy]=arrayToBuffer[4][b];
//if(arrayToBuffer[5][b]!=arrayToBuffer[100][b])
   buffer5[b+shiftBarBackBy]=arrayToBuffer[5][b];
//if(arrayToBuffer[6][b]!=arrayToBuffer[100][b])
   buffer6[b+shiftBarBackBy]=arrayToBuffer[6][b];
//if(arrayToBuffer[7][b]!=arrayToBuffer[100][b])   
   buffer7[b+shiftBarBackBy]=arrayToBuffer[7][b];
//if(arrayToBuffer[8][b]!=arrayToBuffer[100][b])
   buffer8[b+shiftBarBackBy]=arrayToBuffer[8][b];
//if(arrayToBuffer[9][b]!=arrayToBuffer[100][b])
   buffer9[b+shiftBarBackBy]=arrayToBuffer[9][b];
//if(arrayToBuffer[10][b]!=arrayToBuffer[100][b])
   buffer10[b+shiftBarBackBy]=arrayToBuffer[10][b];
////   mainChart[b+shiftBarBackBy]=arrayToBuffer[11][b];
//

    }
 }

//+------------------------------------------------------------------+
//void drawChart()   
//+------------------------------------------------------------------+

void dataToDrawChart(int wichChart,string s,int t,int bStart) //drawCandleAsLine(Symbol(),PERIOD_CURRENT,0,howMuchBfromStart,85);//2-PERIOD, Last-where to draw,4-take data from+candlesToCheck///
{
  
 int bHowMuchDraw=98;
 int putBackBy=0;
 
 if(wichChart==0)
   {
   bHowMuchDraw=howMuchBfromStart+candlesToCheck;
   putBackBy=98-bHowMuchDraw;
   }
 int from=bStart+candlesToCheck;
 int till=bStart-bHowMuchDraw+candlesToCheck;   
 if(bStart>98 || wichChart==0)
   {
  // ChartSetSymbolPeriod
  
   for(int bar=from;bar>till;bar--)
     {
     
     if(bar==bStart+candlesToCheck)
       {
     
        zeroPoint=iClose(s,t,bar);

        if(MarketInfo(s,MODE_DIGITS)==3)
           dividedBy=100;
        else
           dividedBy=1;
       }//
  
 arrayToBuffer[wichChart][bHowMuchDraw+putBackBy]=((iClose(s,t,bar)-zeroPoint)/dividedBy)+500;
 SetIndexLabel(wichChart,s);
 bHowMuchDraw--;
      }
      }
}  
  
//+------------------------------------------------------------------+
//| DataInTab                                                                 |
//+------------------------------------------------------------------+
  
bool DataInTab(int t,string sm,int sp)//DataInTab(tab,SymbolName(s,true),enumPrioud[p])
{
//Print(sp+"--------------------");
   //arrayFractalCandleCorr[0][t]=t+" "+ sm+" "+IntegerToString(sp);
   countArray=1;

ArrayResize(vectorX,  candlesToCheck );
ArrayResize(vectorY, candlesToCheck );


int CurrentB;

//
   for(int s=0;s<=rowsMW;s++)
      {
      for(int p1=0;p1<perioud;p1++)
         {
          bingo=0;
          CurrentB=howMuchBfromStart+candlesToCheck;
          for(int b=candleToScan;b>100;b--)
             {
              if( (iClose(sm,sp,CurrentB)>iOpen(sm,sp,CurrentB)  &&    iClose(SymbolName(s,true),enumPrioud[p1],b)>iOpen(SymbolName(s,true),enumPrioud[p1],b)) ||
                  (iClose(sm,sp,CurrentB)<iOpen(sm,sp,CurrentB)  &&    iClose(SymbolName(s,true),enumPrioud[p1],b)<iOpen(SymbolName(s,true),enumPrioud[p1],b))     )
                {
                  
                 bingo++;
                 CurrentB--;
                                                         
  // if ((isFractal(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b)==true && wichData==ButtonFC1 )|| (bingo==candlesToCheck && wichData==ButtonFC2 )
//)
        if( 
           (bingo==candlesToCheck  && isFractal(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b)==true &&
            PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"H")>minCorr &&
            PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"L")>minCorr &&
            PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"O")>minCorr &&
            PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"C")>minCorr         ) 
          ||
          (isFractal(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b)==true && wichData==ButtonFC1 )
          ||         
          (bingo==candlesToCheck && wichData==ButtonFC2 )
          ||
          (    PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"L")>minCorr &&
               PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"O")>minCorr &&
               PearsonCorr_r(sm,sp,CurrentB, SymbolName(s,true),enumPrioud[p1],b,"C")>minCorr  && wichData==ButtonFC3  )

           )
         
                {
                   
             //Print("symbolA=  "+sm+"  "+sp+"  "+CurrentB+"   SymbolB"+SymbolName(s,true)+"  "+enumPrioud[p1]+"  "+b);
            //      static int test;
           //      Comment(test++);
                    bingo=0;
                    CurrentB=howMuchBfromStart+candlesToCheck;    
                 
                 if(countArray>100)
                   return false;
                    arrayFractalCandleCorr[countArray][t]=SymbolName(s,true)+" "+IntegerToString(enumPrioud[p1])+" "+ IntegerToString(b-1);//+candlesToCheck);
                     if(bigestCountArray<countArray)
                        bigestCountArray=countArray;                     
                     countArray++;
                    
                }
 
             }
                 
          else
             {
             
             
              bingo=0;
              CurrentB=howMuchBfromStart+candlesToCheck;
             
             }        
                  }
                }
             }
//---
if(countArray>1)
 {
    arrayFractalCandleCorr[0][t]=sm+" "+IntegerToString(sp)+" "+IntegerToString(howMuchBfromStart);

    return true;
 }
return false;

}
 
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
  }
  
//+------------------------------------------------------------------+
//|  OnChartEvent                                              |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)
  {
//---
//static int testy;

if(sparam==ButtonFC1)
 {

  ObjectsDeleteAll();
  ButtonMainBuilder();

     ObjectCreate (ButtonFC1,OBJ_BUTTON,0,0,0);
     ObjectSet      (ButtonFC1,OBJPROP_XDISTANCE,(0.1)*spradBetweenTabsMainButtons);
     ObjectSet      (ButtonFC1,OBJPROP_YDISTANCE,1*buttonsDown);
     ObjectSetText(ButtonFC1,ButtonFC1,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC2,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC2,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC2,OBJPROP_YDISTANCE,2*buttonsDown);
     ObjectSetText(ButtonFC2,ButtonFC2,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC3,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC3,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC3,OBJPROP_YDISTANCE,3*buttonsDown);
     ObjectSetText(ButtonFC3,ButtonFC3,FontSizeMainButtons,"Time New Roman",clrGreen);  

     ObjectCreate (ButtonFC4,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC4,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC4,OBJPROP_YDISTANCE,4*buttonsDown);
     ObjectSetText(ButtonFC4,ButtonFC4,FontSizeMainButtons,"Time New Roman",clrGreen);  

   wichData=ButtonFC1;
  StartProcess();
 }

if(sparam==ButtonFC2)
 {
   ObjectsDeleteAll();
   ButtonMainBuilder();
   ButtonDataBuilder();

   wichData=ButtonFC2;
   StartProcess();
 }
 
if(sparam==ButtonFC3)
 {
 
   ObjectsDeleteAll();
   ButtonMainBuilder();
   ButtonDataBuilder();
   
   wichData=ButtonFC3;
   StartProcess();
 }

if(sparam==ButtonFC4)
 {
   ObjectsDeleteAll();
   ButtonMainBuilder();
   ButtonDataBuilder();

   StartProcess();
 }
//--------To show linesGraphs 
/*
            if((s!=Symbol() || p!=Period()) && r2==0)
              {
              ChartSetSymbolPeriod(0,s,p);
              
              }
*/
  
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

for(int tab1=0;tab1<=tab;tab1++)
      {    
     
        {
       if(sparam==IntegerToString(tab1)+","+IntegerToString(0))
          {
             //Print(TimeCurrent()+"----------");
             cleanData();
             preparDataToDrawChart(tab1);
             DrawLinesGraphs();
             
             
           }
         }
       }
//-------To show candleCharts of specific symbol       
       
for(int t2=0;t2<tab;t2++)
   {
   int rowsInTab=howMuchRows(t2);
   for(int r2=0;r2<=rowsInTab;r2++)       
       {
       if(sparam==IntegerToString(t2)+","+IntegerToString(r2))
         {   

//---------------SplitString
int    iFirst     = StringFind( arrayFractalCandleCorr[r2][t2], " "),
       iSecond = StringFind( arrayFractalCandleCorr[r2][t2], " ", iFirst + 1);

string s      = StringSubstr( arrayFractalCandleCorr[r2][t2], 0, iFirst);
int         p  = int(StringSubstr(arrayFractalCandleCorr[r2][t2] , iFirst+1 , iSecond - iFirst - 1)),
         startB      = int(StringSubstr( arrayFractalCandleCorr[r2][t2], iSecond + 1));
//---------------EndSplitString                 
          //       dataToDrawChart(r2,s,StringToInteger(p),StringToInteger(startB)); //dataToDrawChart(int wichChart,int s,int t,int bStart)      
          ChartSetSymbolPeriod(ChartFirst(),s,p);
          drawCandle(s,p,startB,candlesToCheck,howMuchBfromStart);
              
         }

       
       }
     }
       
    }
//+------------------------------------------------------------------+
//| cleanData                                                                 |
//+------------------------------------------------------------------+
void cleanData()
{

for(int t=0;t<=100;t++)
  {
   for(int r=0;r<=100;r++)
       arrayToBuffer[r][t]=EMPTY_VALUE;
       
   if(t<=12)
      SetIndexLabel(t,IntegerToString(t));
   }
}
//+------------------------------------------------------------------+
//|  howMuchRows                                                                |
//+------------------------------------------------------------------+

int howMuchRows(int t)
  {
  //Print("--------------t="+t);
    for(int y=0;y<=bigestCountArray;y++)
        {
          //if(t=1);
          //y   Print(y);
       if(arrayFractalCandleCorr[y][t]==arrayFractalCandleCorr[980][980])
         {
         // 
          return y;
          
          }

          }
       
    return 10;
  }  

//+------------------------------------------------------------------+
//| isFractal                                                                 |
//+------------------------------------------------------------------+

bool isFractal(string st,int pt,int bt, string sr,int pr,int br)
{

  bt=howMuchBfromStart-1;
  br-=2;
  for(int lastB=0;lastB<candlesToCheck;lastB++)
     {
    
     
     if(wichFractal(st,pt,bt+lastB)!=wichFractal(sr,pr,br+lastB))
       return false;
     }
  return true;

}
//+------------------------------------------------------------------+
//| wichFractal                                                                 |
//+------------------------------------------------------------------+
string wichFractal(string s,int p,int b)
{
 if(iFractals(s,p,MODE_UPPER,b)!=0)
   return "up";
 else
  if(iFractals(s,p,MODE_LOWER,b)!=0)
   return "down";

 return "empty";
}

//+------------------------------------------------------------------+
//|PearsonCorr_r                                                                  |
//+------------------------------------------------------------------+
double   PearsonCorr_r( string st,int pt,int bt, string sr,int pr,int br,string whichData
                     ){
                     
//------------------------     
  bt=howMuchBfromStart-1;
  br-=2;
  for(int lastB=0;lastB<candlesToCheck;lastB++)
     {
      if(whichData=="H")
        {
         vectorX[lastB] =iHigh(st,pt,pt+lastB);
         vectorY[lastB]=iHigh(sr,pr,br+lastB);
        }
       else
          if(whichData=="L")
            {
              vectorX[lastB] =iLow(st,pt,pt+lastB);
              vectorY[lastB]=iLow(sr,pr,br+lastB);
            }
            
           else
             if(whichData=="O")
               {
                vectorX[lastB] =iOpen(st,pt,pt+lastB);
                vectorY[lastB]=iOpen(sr,pr,br+lastB);
               }
             else
                 if(whichData=="C")
                   {
                    vectorX[lastB] =iClose(st,pt,pt+lastB);
                    vectorY[lastB]=iClose(sr,pr,br+lastB);
                   }
     }
     
//------------------------     
     
               
      double  pearson_r=0;               
      double  sumX = 0,
             meanX = 0,
             meanY = 0,
              sumY = 0,
             sumXY = 0,
             sumX2 = 0,
             sumY2 = 0;
          // deviation_score_x[],               // may be re-used for _x^2
          // deviation_score_y[],               // may be re-used for _y^2
          // deviation_score_xy[];
/* =====================================================================
                  DEVIATION SCORES                                       >>> http://onlinestatbook.com/2/describing_bivariate_data/calculation.html
        X[]  Y[]  x      y      xy    x^2    y^2
        1    4   -3     -5      15    9     25
        3    6   -1     -3       3    1      9
        5   10    1      1       1    1      1
        5   12    1      3       3    1      9
        6   13    2      4       8    4     16
       _______________________________________

SUM    20   45    0      0      30   16     60
MEAN    4    9    0      0       6   

       r = SUM(xy) / SQRT(  SUM( x^2 ) * SUM( y^2 ) )
       r =      30 / SQRT( 960 )
       r = 0.968
   =====================================================================
                                                                        */
      int    vector_maxLEN = MathMin( ArrayRange( vectorX, 0 ),
                                      ArrayRange( vectorY, 0 )
                                      );

      if (   vector_maxLEN == 0 ){
             pearson_r = VAL_ERROR;          // STOR VAL ERROR IN RESULT
             return(     RET_ERROR );        // FLAG RET_ERROR in JIT/RET
      }
      for ( int jj = 0; jj < vector_maxLEN; jj++ ){
            sumX += vectorX[jj];
            sumY += vectorY[jj];
      }
      meanX = sumX / vector_maxLEN;          // DIV!0 FUSED
      meanY = sumY / vector_maxLEN;          // DIV!0 FUSED

      for ( int jj = 0; jj < vector_maxLEN; jj++ ){
         // deviation_score_x[ jj] =   meanX - vectorX[jj];  //
         // deviation_score_y[ jj] =   meanY - vectorY[jj];
         // deviation_score_xy[jj] = deviation_score_x[jj]
         //                        * deviation_score_y[jj];
         //              sumXY    += deviation_score_x[jj]
         //                        * deviation_score_y[jj];
                         sumXY    += ( meanX - vectorX[jj] ) // PSPACE MOTIVATED MINIMALISTIC WITH CACHE-BENEFITS IN PROCESSING
                                   * ( meanY - vectorY[jj] );
         // deviation_score_x[jj] *= deviation_score_x[jj];  // PSPACE MOTIVATED RE-USE, ROW-WISE DESTRUCTIVE, BUT VALUE WAS NEVER USED AGAIN
         //              sumX2    += deviation_score_x[jj]
         //                        * deviation_score_x[jj];
                         sumX2    += ( meanX - vectorX[jj] ) // PSPACE MOTIVATED MINIMALISTIC WITH CACHE-BENEFITS IN PROCESSING
                                   * ( meanX - vectorX[jj] );
         // deviation_score_y[jj] *= deviation_score_y[jj];  // PSPACE MOTIVATED RE-USE, ROW-WISE DESTRUCTIVE, BUT VALUE WAS NEVER USED AGAIN
         //              sumY2    += deviation_score_y[jj]
         //                        * deviation_score_y[jj];
                         sumY2    += ( meanY - vectorY[jj] ) // PSPACE MOTIVATED MINIMALISTIC WITH CACHE-BENEFITS IN PROCESSING
                                   * ( meanY - vectorY[jj] );
      }
      
   if(MathSqrt( sumX2 * sumY2  )!=0)
      pearson_r = sumXY
                / MathSqrt( sumX2
                          * sumY2
                            );            // STOR RET VALUE IN RESULT
      return( pearson_r );                   // FLAG
      
      }
//------------
//+------------------------------------------------------------------+
//| DrawTable                                                                 |
//+------------------------------------------------------------------+
void DrawTable()
{
int cutDownBy=0,newLine=0,cutDownIf=14,countDownIfPlus;
 countDownIfPlus=cutDownIf;
     for(int x=0;x<tab;x++)
        {   
         if(x==cutDownIf)
           {
         
            cutDownIf+=countDownIfPlus;
            cutDownBy=cutDownBy+((bigestCountArray+countDownIfPlus)*3);
            newLine=(x)*spradBetweenTabs;
            
            }
   
     for(int y=0;y<=bigestCountArray;y++)
         {

       
         ObjectCreate  (IntegerToString(x)+","+IntegerToString(y),OBJ_LABEL,0,0,0);
         ObjectSet       (IntegerToString(x)+","+IntegerToString(y),OBJPROP_XDISTANCE,(x+1)*spradBetweenTabs-newLine);
         ObjectSet       (IntegerToString(x)+","+IntegerToString(y),OBJPROP_YDISTANCE,(PutDownBy+y)*7+cutDownBy);
         ObjectSetText(IntegerToString(x)+","+IntegerToString(y),arrayFractalCandleCorr[y][x],5,"Time New Roman",clrBlack);
         
         
         
     //   
        }
 
    }
     
}
//+------------------------------------------------------------------+
//| drawCandle                                                                 |
//+------------------------------------------------------------------+
void drawCandle(string s,int p,int startFroB,int BNum,int drawBAtPlace)
  {
 //----- Cleaning values

  for(int i=0;i<BNum+1;i++)
    {
 //  Print(i+drawBAtPlace-1);
                 bodyHighGreen[i+drawBAtPlace]=bodyHighGreen[85];
                 bodyLowGreen[i+drawBAtPlace]=bodyHighGreen[85];        

                 bodyHighRed[i+drawBAtPlace]=bodyHighGreen[85];
                 bodyLowRed[i+drawBAtPlace]=bodyHighGreen[85];     
    }

 // BNum+=14;)-zeroP
     startFroB-=1;
     zeroPoint=iClose(s,p,startFroB);

        if(MarketInfo(s,MODE_DIGITS)==3)
           dividedBy=100;
        else 
           dividedBy=1;
 
  for(int i=1;i<=BNum;i++)
    {

                double bodyHigh1=MathMax(((iClose(s,p,i+startFroB)-zeroPoint)/dividedBy)+500,(iOpen(s,p,i+startFroB)-zeroPoint)/dividedBy+500),
                       bodyLow1=MathMin(((iClose(s,p,i+startFroB)-zeroPoint)/dividedBy)+500,(iOpen(s,p,i+startFroB)-zeroPoint)/dividedBy+500); 
               
              //  if((iClose(s,p,i+startFroB)-zeroPoint)/dividedBy>(iOpen(s,p,i+startFroB)-zeroPoint)/dividedBy)
               if(iClose(s,p,i+startFroB)>iOpen(s,p,i+startFroB))

                 { 
                  bodyHighGreen[i+drawBAtPlace-1]=bodyHigh1;
                  bodyLowGreen[i+drawBAtPlace-1]=bodyLow1;   
              //    Print(bodyHighGreen[i+drawBAtPlace-1]+"  "+bodyLowGreen[i+drawBAtPlace-1]);     
                 }
                else
                  {
                  bodyHighRed[i+drawBAtPlace-1]=bodyHigh1;
                  bodyLowRed[i+drawBAtPlace-1]= bodyLow1;
             //     Print(bodyHighRed[i+drawBAtPlace-1]+"  "+bodyLowRed[i+drawBAtPlace-1]);     
                 }  
          }
  }
//+------------------------------------------------------------------+
//| ButtonMainBuilder                                                |
//+------------------------------------------------------------------+
void ButtonMainBuilder()
{
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

}  
 //+------------------------------------------------------------------+
 //| ButtonDataBuilder                                                                 |
 //+------------------------------------------------------------------+
 void ButtonDataBuilder()
   {  
     ObjectCreate (ButtonFC1,OBJ_BUTTON,0,0,0);
     ObjectSet      (ButtonFC1,OBJPROP_XDISTANCE,(0.1)*spradBetweenTabsMainButtons);
     ObjectSet      (ButtonFC1,OBJPROP_YDISTANCE,1*buttonsDown);
     ObjectSetText(ButtonFC1,ButtonFC1,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC2,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC2,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC2,OBJPROP_YDISTANCE,2*buttonsDown);
     ObjectSetText(ButtonFC2,ButtonFC2,FontSizeMainButtons,"Time New Roman",clrBlue);

     ObjectCreate (ButtonFC3,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC3,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC3,OBJPROP_YDISTANCE,3*buttonsDown);
     ObjectSetText(ButtonFC3,ButtonFC3,FontSizeMainButtons,"Time New Roman",clrGreen);  

     ObjectCreate (ButtonFC4,OBJ_BUTTON,0,0,0);
     ObjectSet    (ButtonFC4,OBJPROP_XDISTANCE,(1)*spradBetweenTabsMainButtons);
     ObjectSet    (ButtonFC4,OBJPROP_YDISTANCE,4*buttonsDown);
     ObjectSetText(ButtonFC4,ButtonFC4,FontSizeMainButtons,"Time New Roman",clrGreen);  
    }   