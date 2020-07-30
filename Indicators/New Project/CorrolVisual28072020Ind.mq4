//+------------------------------------------------------------------+
//|                                      CorrolVisual28072020Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      CorrolVisual30112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      CorrolVisual09112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                      CorrolVisual07112018Ind.mq4 |
//+------------------------------------------------------------------+
//|                                              CorrolVisualInd.mq4 |
//|                        Copyright 2016, MetaQuotes Software Corp. |
//|                                             https://www.mql5.com |
//+------------------------------------------------------------------+
#property copyright "Copyright 2016, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property indicator_separate_window
#property indicator_buffers 40

#property  indicator_color1 clrBlack
#property  indicator_color2 clrMaroon
#property  indicator_color3 clrSeaGreen
#property  indicator_color4 clrLightSeaGreen
#property  indicator_color5 clrGoldenrod
#property  indicator_color6 clrDarkOrange
#property  indicator_color7 clrDeepSkyBlue
#property  indicator_color8 clrDarkGreen
#property  indicator_color9 clrIndigo
#property  indicator_color10 clrDarkGoldenrod
#property  indicator_color11 clrDarkViolet
#property  indicator_color12 clrYellow
#property  indicator_color13 clrMediumSpringGreen
#property  indicator_color14 clrOrange
#property  indicator_color15 clrBlue
#property  indicator_color16 clrDeepPink
#property  indicator_color17 clrGreen
#property  indicator_color18 clrDimGray
#property  indicator_color19 clrOrangeRed
#property  indicator_color20 clrTeal
#property  indicator_color21 clrSaddleBrown
#property  indicator_color22 clrNavy
#property  indicator_color23 clrForestGreen
#property  indicator_color24 clrDarkTurquoise
#property  indicator_color25 clrCrimson
#property  indicator_color26 clrLimeGreen
#property  indicator_color27 clrPurple
#property  indicator_color28 clrOliveDrab
#property  indicator_color29 clrDimGray
#property  indicator_color30 clrSteelBlue
#property  indicator_color31 clrYellow
#property  indicator_color32 clrYellow
#property  indicator_color33 clrYellow
#property  indicator_color34 clrYellow
#property  indicator_color35 clrYellow
#property  indicator_color36 clrYellow
#property  indicator_color37 clrYellow
#property  indicator_color38 clrYellow
#property  indicator_color39 clrYellow
#property  indicator_color40 clrYellow


string colorForSymbols[]=
{
clrBlack
,clrMaroon
,clrSeaGreen
,clrLightSeaGreen
,clrGoldenrod
,clrDarkOrange
,clrDeepSkyBlue
,clrDarkGreen
,clrIndigo
,clrDarkGoldenrod
,clrDarkViolet
,clrYellow
,clrMediumSpringGreen
,clrOrange
,clrBlue
,clrDeepPink
,clrGreen
,clrDimGray
,clrOrangeRed
,clrTeal
,clrSaddleBrown
,clrNavy
,clrForestGreen
,clrDarkTurquoise
,clrCrimson
,clrLimeGreen
,clrPurple
,clrOliveDrab
,clrDimGray
,clrSteelBlue
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow
,clrYellow

};

int rowsMW=SymbolsTotal(true)-1;//rows

double B[40][300];
double B0[9000],B1[9000],B2[9000],B3[9000],B4[9000],B5[9000],B6[9000],B7[9000],B8[9000],B9[9000],B10[9000],B11[9000],B12[9000],B13[9000],B14[9000],
B15[9000],B16[9000],B17[9000],B18[9000],B19[9000],B20[9000],B21[9000],B22[9000],B23[9000],B24[9000],B25[9000],B26[9000],B27[9000],B28[9000],B29[9000],
B30[9000],B31[9000],B32[9000],B33[9000],B34[9000],B35[9000],B36[9000],B37[9000],B38[9000],B39[9000],B40[9000];

double spradBetweenTabsMainButtons=1,PutDownByMainButtons=1.9,FontSizeMainButtons=10;

double pips;
double step[28];
string symbols[40];
double ArraySymbolsByCorrolation[100][100];
extern int CorBars=147;

datetime time;

double bigPrice;

string Button1="Visual",Button2="2Charts",Button3="A.Data",Button4="Table";

static int spradBetweenTabs=50,PutDownBy=3,NewRightRow=0,PutDown1,PutDown2=0,countyForRightTabs;
string CurrencyName[]=
  {
   "AUD",
   "CAD",
   "CHF",
   "EUR",
   "JPY",
   "NZD",
   "GBP",
   "USD",
   "SGD"
  };
bool draw=true;
//+------------------------------------------------------------------+
//|                                                                  |
//+------------------------------------------------------------------+

int init()
  {
ArrayResize(symbols,rowsMW+1);
ArrayResize(ArraySymbolsByCorrolation,rowsMW+1);


//ObjectsDeleteAll();

   for(int y=0;y<SymbolsTotal(true);y++)
     {
      symbols[y]=SymbolName(y,true);

     }

//symbols[0]="AUDCAD";
//symbols[1]="AUDJPY";
//symbols[2]="AUDCHF";
//symbols[3]="AUDNZD";
//symbols[4]="AUDUSD";
//symbols[5]="EURUSD";
//symbols[6]="EURJPY";
//symbols[7]="EURNZD";
//symbols[8]="EURGBP";
//symbols[9]="EURCAD";
//symbols[10]="EURAUD";
//symbols[11]="EURCHF";
//symbols[12]="CADJPY";
//symbols[13]="CADCHF";
//symbols[14]="CHFJPY";
//symbols[15]="GBPAUD";
//symbols[16]="GBPCAD";
//symbols[17]="GBPJPY";
//symbols[18]="GBPCHF";
//symbols[19]="GBPNZD";
//symbols[20]="GBPSGD";
//symbols[21]="GBPUSD";
//symbols[22]="NZDCAD";
//symbols[23]="NZDCHF";
//symbols[24]="NZDJPY";
//symbols[25]="NZDUSD";
//symbols[26]="USDJPY";
//symbols[27]="USDCHF";
//symbols[28]="USDCAD";
//symbols[29]="USDSGD";
//symbols[30]="CADCHF";
//symbols[31]="CADCHF";
//symbols[32]="CADCHF";
//symbols[33]="CADCHF";
//symbols[34]="CADCHF";
//symbols[35]="CADCHF";
//symbols[36]="CADCHF";
//symbols[37]="CADCHF";
//symbols[38]="CADCHF";
//symbols[39]="CADCHF";
//symbols[40]="CADCHF";

   pips=MarketInfo(Symbol(),MODE_TICKSIZE);
   if(pips==0.00001 || pips==0.001)
      pips=pips*10;

   SetIndexStyle(0,DRAW_LINE);
   SetIndexBuffer(0,B0);
   SetIndexLabel(0,symbols[0]);

   SetIndexStyle(1,DRAW_LINE);
   SetIndexBuffer(1,B1);
   SetIndexLabel(1,symbols[1]);

   SetIndexStyle(2,DRAW_LINE);
   SetIndexBuffer(2,B2);
   SetIndexLabel(2,symbols[2]);

   SetIndexStyle(3,DRAW_LINE);
   SetIndexBuffer(3,B3);
   SetIndexLabel(3,symbols[3]);

   SetIndexStyle(4,DRAW_LINE);
   SetIndexBuffer(4,B4);
   SetIndexLabel(4,symbols[4]);

   SetIndexStyle(5,DRAW_LINE);
   SetIndexBuffer(5,B5);
   SetIndexLabel(5,symbols[5]);

   SetIndexStyle(6,DRAW_LINE);
   SetIndexBuffer(6,B6);
   SetIndexLabel(6,symbols[6]);

   SetIndexStyle(7,DRAW_LINE);
   SetIndexBuffer(7,B7);
   SetIndexLabel(7,symbols[7]);

   SetIndexStyle(8,DRAW_LINE);
   SetIndexBuffer(8,B8);
   SetIndexLabel(8,symbols[8]);

   SetIndexStyle(9,DRAW_LINE);
   SetIndexBuffer(9,B9);
   SetIndexLabel(9,symbols[9]);

   SetIndexStyle(10,DRAW_LINE);
   SetIndexBuffer(10,B10);
   SetIndexLabel(10,symbols[10]);

   SetIndexStyle(11,DRAW_LINE);
   SetIndexBuffer(11,B11);
   SetIndexLabel(11,symbols[11]);

   SetIndexStyle(12,DRAW_LINE);
   SetIndexBuffer(12,B12);
   SetIndexLabel(12,symbols[12]);

   SetIndexStyle(13,DRAW_LINE);
   SetIndexBuffer(13,B13);
   SetIndexLabel(13,symbols[13]);

   SetIndexStyle(14,DRAW_LINE);
   SetIndexBuffer(14,B14);
   SetIndexLabel(14,symbols[14]);

   SetIndexStyle(15,DRAW_LINE);
   SetIndexBuffer(15,B15);
   SetIndexLabel(15,symbols[15]);

   SetIndexStyle(16,DRAW_LINE);
   SetIndexBuffer(16,B16);
   SetIndexLabel(16,symbols[16]);

   SetIndexStyle(17,DRAW_LINE);
   SetIndexBuffer(17,B17);
   SetIndexLabel(17,symbols[17]);

   SetIndexStyle(18,DRAW_LINE);
   SetIndexBuffer(18,B18);
   SetIndexLabel(18,symbols[18]);

   SetIndexStyle(19,DRAW_LINE);
   SetIndexBuffer(19,B19);
   SetIndexLabel(19,symbols[19]);

   SetIndexStyle(20,DRAW_LINE);
   SetIndexBuffer(20,B20);
   SetIndexLabel(20,symbols[20]);

   SetIndexStyle(21,DRAW_LINE);
   SetIndexBuffer(21,B21);
   SetIndexLabel(21,symbols[21]);

   SetIndexStyle(22,DRAW_LINE);
   SetIndexBuffer(22,B22);
   SetIndexLabel(22,symbols[22]);

   SetIndexStyle(23,DRAW_LINE);
   SetIndexBuffer(23,B23);
   SetIndexLabel(23,symbols[23]);

   SetIndexStyle(24,DRAW_LINE);
   SetIndexBuffer(24,B24);
   SetIndexLabel(24,symbols[24]);

   SetIndexStyle(25,DRAW_LINE);
   SetIndexBuffer(25,B25);
   SetIndexLabel(25,symbols[25]);

   SetIndexStyle(26,DRAW_LINE);
   SetIndexBuffer(26,B26);
   SetIndexLabel(26,symbols[26]);

   SetIndexStyle(27,DRAW_LINE);
   SetIndexBuffer(27,B27);
   SetIndexLabel(27,symbols[27]);

   SetIndexStyle(28,DRAW_LINE);
   SetIndexBuffer(28,B28);
   SetIndexLabel(28,symbols[28]);

   SetIndexStyle(29,DRAW_LINE);
   SetIndexBuffer(29,B29);
   SetIndexLabel(29,symbols[29]);

   SetIndexStyle(30,DRAW_LINE);
   SetIndexBuffer(30,B30);
   SetIndexLabel(30,symbols[30]);

//SetIndexStyle(31,DRAW_LINE);
//SetIndexBuffer(31,B31);
//SetIndexLabel(31,symbols[31]);
//
//SetIndexStyle(32,DRAW_LINE);
//SetIndexBuffer(32,B32);
//SetIndexLabel(32,symbols[32]);
//
//SetIndexStyle(33,DRAW_LINE);
//SetIndexBuffer(33,B33);
//SetIndexLabel(33,symbols[33]);
//
//SetIndexStyle(34,DRAW_LINE);
//SetIndexBuffer(34,B34);
//SetIndexLabel(34,symbols[34]);
//
//SetIndexStyle(35,DRAW_LINE);
//SetIndexBuffer(35,B35);
//SetIndexLabel(35,symbols[35]);
//
//SetIndexStyle(36,DRAW_LINE);
//SetIndexBuffer(36,B36);
//SetIndexLabel(36,symbols[36]);
//
//SetIndexStyle(37,DRAW_LINE);
//SetIndexBuffer(37,B37);
//SetIndexLabel(37,symbols[37]);
//
//SetIndexStyle(38,DRAW_LINE);
//SetIndexBuffer(38,B38);
//SetIndexLabel(38,symbols[38]);
//
//SetIndexStyle(39,DRAW_LINE);
//SetIndexBuffer(39,B39);
//SetIndexLabel(39,symbols[39]);
//
//SetIndexStyle(40,DRAW_LINE);
//SetIndexBuffer(40,B40);
//SetIndexLabel(40,symbols[40]);

   IndicatorDigits(5);

   IndicatorShortName(WindowExpertName());
   bigPrice=BigestPrice();

   ObjectCreate(Button1,OBJ_BUTTON,0,0,0);
   ObjectSet(Button1,OBJPROP_XDISTANCE,(0.1)*spradBetweenTabsMainButtons);
   ObjectSet(Button1,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
   ObjectSetText(Button1,Button1,FontSizeMainButtons,"Time New Roman",clrBlue);

   ObjectCreate(Button2,OBJ_BUTTON,0,0,0);
   ObjectSet(Button2,OBJPROP_XDISTANCE,(60)*spradBetweenTabsMainButtons);
   ObjectSet(Button2,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
   ObjectSetText(Button2,Button2,FontSizeMainButtons,"Time New Roman",clrBlue);

   ObjectCreate(Button3,OBJ_BUTTON,0,0,0);
   ObjectSet(Button3,OBJPROP_XDISTANCE,(120)*spradBetweenTabsMainButtons);
   ObjectSet(Button3,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
   ObjectSetText(Button3,Button3,FontSizeMainButtons,"Time New Roman",clrGreen);

   ObjectCreate(Button4,OBJ_BUTTON,0,0,0);
   ObjectSet(Button4,OBJPROP_XDISTANCE,(180)*spradBetweenTabsMainButtons);
   ObjectSet(Button4,OBJPROP_YDISTANCE,(PutDownByMainButtons-1)*15);
   ObjectSetText(Button4,Button4,FontSizeMainButtons,"Time New Roman",clrGreen);

   return(0);

  }

//+------------------------------------------------------------------+
//| DrawTable                                                        |
//+------------------------------------------------------------------+
void DrawTable()
{
   for(int row=0; row<rowsMW+1;row++)

     {
      static double PitDown5=1.2;
      if(row==0)
        {
         ObjectCreate(0,"DrawAll",OBJ_LABEL,1,0,0);
         ObjectSet("DrawAll",OBJPROP_XDISTANCE,(0.2)*50);
         ObjectSet("DrawAll",OBJPROP_YDISTANCE,(PitDown5+row)*15);
         ObjectSetText("DrawAll","DrawAll",9,"Arial Bold",clrBlack);

         ObjectCreate(0,"DrawAll+",OBJ_BUTTON,1,0,0);
         ObjectSet("DrawAll+",OBJPROP_XDISTANCE,(1.3)*50);
         ObjectSet("DrawAll+",OBJPROP_YDISTANCE,(PitDown5+row)*15);
         ObjectSetText("DrawAll+","+",7,"Arial Bold",clrBlack);

         ObjectCreate(0,"DrawAll-",OBJ_BUTTON,1,0,0);
         ObjectSet("DrawAll-",OBJPROP_XDISTANCE,(2.4)*50);
         ObjectSet("DrawAll-",OBJPROP_YDISTANCE,(PitDown5+row)*15);
         ObjectSetText("DrawAll-","-",7,"Arial Bold",clrBlack);
        }
        
      ObjectCreate(0,symbols[row],OBJ_LABEL,1,0,0);
      ObjectSet(symbols[row],OBJPROP_XDISTANCE,(0.2)*50);
      ObjectSet(symbols[row],OBJPROP_YDISTANCE,(PutDownBy+row)*15);
      ObjectSetText(symbols[row],symbols[row],9,"Arial Bold",StringToColor(colorForSymbols[row]));

      ObjectCreate(0,SymbolName(ArraySymbolsByCorrolation[row][1],true)+"ByCorrolation",OBJ_LABEL,1,0,0);
      ObjectSet(SymbolName(ArraySymbolsByCorrolation[row][1],true)+"ByCorrolation",OBJPROP_XDISTANCE,(0.2+25)*50);
      ObjectSet(SymbolName(ArraySymbolsByCorrolation[row][1],true)+"ByCorrolation",OBJPROP_YDISTANCE,(4+row)*11.3);
      int SymbColor=ArraySymbolsByCorrolation[row][1];
      ObjectSetText(SymbolName(ArraySymbolsByCorrolation[row][1],true)+"ByCorrolation",SymbolName(ArraySymbolsByCorrolation[row][1],true),8,"Arial Bold",StringToColor(colorForSymbols[SymbColor]));
      
//Print(colorForSymbols[SymbColor]);

      ObjectCreate(0,symbols[row]+"+",OBJ_BUTTON,1,0,0);
      ObjectSet(symbols[row]+"+",OBJPROP_XDISTANCE,(1.3)*50);
      ObjectSet(symbols[row]+"+",OBJPROP_YDISTANCE,(PutDownBy+row)*15);
      ObjectSetText(symbols[row]+"+","+",7,"Arial Bold",clrBlack);

      ObjectCreate(0,symbols[row]+"-",OBJ_BUTTON,1,0,0);
      ObjectSet(symbols[row]+"-",OBJPROP_XDISTANCE,(2.4)*50);
      ObjectSet(symbols[row]+"-",OBJPROP_YDISTANCE,(PutDownBy+row)*15);
      ObjectSetText(symbols[row]+"-","-",7,"Arial Bold",clrBlack);

      if(row<9)
        {
         ObjectCreate(0,CurrencyName[row]+"c",OBJ_LABEL,1,0,0);
         ObjectSet(CurrencyName[row]+"c",OBJPROP_XDISTANCE,(4)*50);
         ObjectSet(CurrencyName[row]+"c",OBJPROP_YDISTANCE,(PutDownBy+row)*15);
         ObjectSetText(CurrencyName[row]+"c",CurrencyName[row],7,"Arial Bold",clrBlack);

         ObjectCreate(0,CurrencyName[row]+"c+",OBJ_BUTTON,1,0,0);
         ObjectSet(CurrencyName[row]+"c+",OBJPROP_XDISTANCE,(4.5)*50);
         ObjectSet(CurrencyName[row]+"c+",OBJPROP_YDISTANCE,(PutDownBy+row)*15);
         ObjectSetText(CurrencyName[row]+"c+","+",7,"Arial Bold",clrBlack);

         ObjectCreate(0,CurrencyName[row]+"c-",OBJ_BUTTON,1,0,0);
         ObjectSet(CurrencyName[row]+"c-",OBJPROP_XDISTANCE,(5.6)*50);
         ObjectSet(CurrencyName[row]+"c-",OBJPROP_YDISTANCE,(PutDownBy+row)*15);
         ObjectSetText(CurrencyName[row]+"c-","-",7,"Arial Bold",clrBlack);

        }
     }
}  
//+------------------------------------------------------------------+
//| start                                                                 |
//+------------------------------------------------------------------+
int start()
  {
   if(draw==true)
     {
      DrawCharts();
      DrawTable();
      draw=false;
     }
   return(0);
  }
//+------------------------------------------------------------------+
//|DrawCharts                                                                  |
//+------------------------------------------------------------------+
void DrawCharts()
  {

   for(int a=30;a>=0;a--)
     {
      int count=0;

      if(count==0)
        {

         double UpPrice=bigPrice-(((iClose(symbols[a],PERIOD_CURRENT,CorBars)+iOpen(symbols[a],PERIOD_CURRENT,CorBars)+iHigh(symbols[a],PERIOD_CURRENT,CorBars)+iLow(symbols[a],PERIOD_CURRENT,CorBars)))/4);

         if(StringSubstr(symbols[a],3,3)=="JPY")
            UpPrice=bigPrice-(((iClose(symbols[a],PERIOD_CURRENT,CorBars)+iOpen(symbols[a],PERIOD_CURRENT,CorBars)+iHigh(symbols[a],PERIOD_CURRENT,CorBars)+iLow(symbols[a],PERIOD_CURRENT,CorBars)))/4)/CorBars;

         count++;
        }

      for(int i=CorBars;i>0;i--)
        {
           {
              {
               B[a][i]=iClose(symbols[a],PERIOD_CURRENT,i)+UpPrice;

               if(StringSubstr(symbols[a],3,3)=="JPY")
                  B[a][i]=(iClose(symbols[a],PERIOD_CURRENT,i)+iOpen(symbols[a],PERIOD_CURRENT,i)+iHigh(symbols[a],PERIOD_CURRENT,i)+iLow(symbols[a],PERIOD_CURRENT,i))/4/CorBars+UpPrice;

               B0[i]=B[0][i];
               B1[i]=B[1][i];
               B2[i]=B[2][i];
               B3[i]=B[3][i];
               B4[i]=B[4][i];
               B5[i]=B[5][i];
               B6[i]=B[6][i];
               B7[i]=B[7][i];
               B8[i]=B[8][i];
               B9[i]=B[9][i];
               B10[i]=B[10][i];
               B11[i]=B[11][i];
               B12[i]=B[12][i];
               B13[i]=B[13][i];
               B14[i]=B[14][i];
               B15[i]=B[15][i];
               B16[i]=B[16][i];
               B17[i]=B[17][i];
               B18[i]=B[18][i];
               B19[i]=B[19][i];
               B20[i]=B[20][i];
               B21[i]=B[21][i];
               B22[i]=B[22][i];
               B23[i]=B[23][i];
               B24[i]=B[24][i];
               B25[i]=B[25][i];
               B26[i]=B[26][i];
               B27[i]=B[27][i];
               B28[i]=B[28][i];
               B29[i]=B[29][i];

              }
           }
        }
     }
               for(int a1=0;a1<=rowsMW+1;a1++)
                  {
                   ArraySymbolsByCorrolation[a1][0]=B[a1][1];
                   ArraySymbolsByCorrolation[a1][1]=a1;
                                      //Print(ArraySymbolsByCorrolation[a1][1]);

                  }
               ArraySort(ArraySymbolsByCorrolation,0,0,MODE_DESCEND);
          
//               for(int a2=0;a2<rowsMW;a2++)
//                  {
//                   Print(ArraySymbolsByCorrolation[a2][1]);
//
//                  }
//               
}


//+------------------------------------------------------------------+
//| DrawCharts2                                                                 |
//+------------------------------------------------------------------+
void DrawCharts2(int row)
  {

   int count=0;

   if(count==0)
     {

      double UpPrice=bigPrice-(((iClose(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iOpen(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iHigh(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iLow(SymbolName(row,true),PERIOD_CURRENT,CorBars)))/4);

      if(StringSubstr(SymbolName(row,true),3,3)=="JPY")
         UpPrice=bigPrice-(((iClose(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iOpen(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iHigh(SymbolName(row,true),PERIOD_CURRENT,CorBars)+iLow(SymbolName(row,true),PERIOD_CURRENT,CorBars)))/4)/CorBars;

      count++;
     }

   for(int i=CorBars;i>0;i--)
     {
        {
           {
            B[row][i]=iClose(SymbolName(row,true),PERIOD_CURRENT,i)+UpPrice;

            if(StringSubstr(SymbolName(row,true),3,3)=="JPY")
               B[row][i]=(iClose(SymbolName(row,true),PERIOD_CURRENT,i)+iOpen(SymbolName(row,true),PERIOD_CURRENT,i)+iHigh(SymbolName(row,true),PERIOD_CURRENT,i)+iLow(SymbolName(row,true),PERIOD_CURRENT,i))/4/CorBars+UpPrice;

            if(row==0)
               B0[i]=B[0][i];
            else
            if(row==1)
               B1[i]=B[1][i];
            else
            if(row==2)
               B2[i]=B[2][i];
            else
            if(row==3)
               B3[i]=B[3][i];
            else
            if(row==4)
               B4[i]=B[4][i];
            else
            if(row==5)
               B5[i]=B[5][i];
            else
            if(row==6)
               B6[i]=B[6][i];
            else
            if(row==7)
               B7[i]=B[7][i];
            else
            if(row==8)
               B8[i]=B[8][i];
            else
            if(row==9)
               B9[i]=B[9][i];
            else
            if(row==10)
               B10[i]=B[10][i];
            else
            if(row==11)
               B11[i]=B[11][i];
            else
            if(row==12)
               B12[i]=B[12][i];
            else
            if(row==13)
               B13[i]=B[13][i];
            else
            if(row==14)
               B14[i]=B[14][i];
            else
            if(row==15)
               B15[i]=B[15][i];
            else
            if(row==16)
               B16[i]=B[16][i];
            else
            if(row==17)
               B17[i]=B[17][i];
            else
            if(row==18)
               B18[i]=B[18][i];
            else
            if(row==19)
               B19[i]=B[19][i];
            else
            if(row==20)
               B20[i]=B[20][i];
            else
            if(row==21)
               B21[i]=B[21][i];
            else
            if(row==22)
               B22[i]=B[22][i];
            else
            if(row==23)
               B23[i]=B[23][i];
            else
            if(row==24)
               B24[i]=B[24][i];
            else
            if(row==25)
               B25[i]=B[25][i];
            else
            if(row==26)
               B26[i]=B[26][i];
            else
            if(row==27)
               B27[i]=B[27][i];
            else
            if(row==28)
               B28[i]=B[28][i];
            else
            if(row==29)
               B29[i]=B[29][i];

           }
        }
     }

//for(int x=CorBars;x>0;x--)
//   {  
//

//B30[x]=B[30][x]; 
//B31[x]=B[31][x];
//B28[x]=B[30][x];    
//B28[x]=B[31][x];    
//B28[x]=B[32][x];    
//B28[x]=B[33][x];    
//B28[x]=B[34][x];    
//B28[x]=B[35][x];    
//B28[x]=B[36][x];    
//B28[x]=B[37][x];    
//B28[x]=B[38][x];    
//B28[x]=B[39][x];    
//B28[x]=B[40][x];    
//
//
//
//
//}
  }
//+------------------------------------------------------------------+
//| DrawCharts3                                                                 |
//+------------------------------------------------------------------+
void DrawCharts3(string currency)
  {
   for(int a=30;a>=0;a--)
     {
      //Print(SymbolName(a,true));
      if(currency==StringSubstr(SymbolName(a,true),3,3) || currency==StringSubstr(SymbolName(a,true),0,3))
        {
         int count=0;

         if(count==0)
           {

            double UpPrice=bigPrice-(((iClose(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iOpen(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iHigh(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iLow(SymbolName(a,true),PERIOD_CURRENT,CorBars)))/4);

            if(StringSubstr(SymbolName(a,true),3,3)=="JPY")
               UpPrice=bigPrice-(((iClose(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iOpen(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iHigh(SymbolName(a,true),PERIOD_CURRENT,CorBars)+iLow(SymbolName(a,true),PERIOD_CURRENT,CorBars)))/4)/CorBars;

            count++;
           }

         for(int i=CorBars;i>0;i--)
           {
              {
                 {
                  B[a][i]=iClose(SymbolName(a,true),PERIOD_CURRENT,i)+UpPrice;

                  if(StringSubstr(SymbolName(a,true),3,3)=="JPY")
                     B[a][i]=(iClose(SymbolName(a,true),PERIOD_CURRENT,i)+iOpen(SymbolName(a,true),PERIOD_CURRENT,i)+iHigh(SymbolName(a,true),PERIOD_CURRENT,i)+iLow(SymbolName(a,true),PERIOD_CURRENT,i))/4/CorBars+UpPrice;

                  B0[i]=B[0][i];
                  B1[i]=B[1][i];
                  B2[i]=B[2][i];
                  B3[i]=B[3][i];
                  B4[i]=B[4][i];
                  B5[i]=B[5][i];
                  B6[i]=B[6][i];
                  B7[i]=B[7][i];
                  B8[i]=B[8][i];
                  B9[i]=B[9][i];
                  B10[i]=B[10][i];
                  B11[i]=B[11][i];
                  B12[i]=B[12][i];
                  B13[i]=B[13][i];
                  B14[i]=B[14][i];
                  B15[i]=B[15][i];
                  B16[i]=B[16][i];
                  B17[i]=B[17][i];
                  B18[i]=B[18][i];
                  B19[i]=B[19][i];
                  B20[i]=B[20][i];
                  B21[i]=B[21][i];
                  B22[i]=B[22][i];
                  B23[i]=B[23][i];
                  B24[i]=B[24][i];
                  B25[i]=B[25][i];
                  B26[i]=B[26][i];
                  B27[i]=B[27][i];
                  B28[i]=B[28][i];
                  B29[i]=B[29][i];

                 }
              }
           }
        }
     }

//for(int x=CorBars;x>0;x--)
//   {
////B30[x]=B[30][x]; 
////B31[x]=B[31][x];
////B28[x]=B[30][x];    
////B28[x]=B[31][x];    
////B28[x]=B[32][x];    
////B28[x]=B[33][x];    
////B28[x]=B[34][x];    
////B28[x]=B[35][x];    
////B28[x]=B[36][x];    
////B28[x]=B[37][x];    
////B28[x]=B[38][x];    
////B28[x]=B[39][x];    
////B28[x]=B[40][x];    
//}
  }
//+------------------------------------------------------------------+
//| DeletCharts                                                                 |
//+------------------------------------------------------------------+
void DeletCharts()
  {

   for(int a=30;a>=0;a--)
     {

      for(int i=CorBars;i>0;i--)
        {
           {
              {
               B[a][i]=EMPTY_VALUE;

               B0[i]=B[0][i];
               B1[i]=B[1][i];
               B2[i]=B[2][i];
               B3[i]=B[3][i];
               B4[i]=B[4][i];
               B5[i]=B[5][i];
               B6[i]=B[6][i];
               B7[i]=B[7][i];
               B8[i]=B[8][i];
               B9[i]=B[9][i];
               B10[i]=B[10][i];
               B11[i]=B[11][i];
               B12[i]=B[12][i];
               B13[i]=B[13][i];
               B14[i]=B[14][i];
               B15[i]=B[15][i];
               B16[i]=B[16][i];
               B17[i]=B[17][i];
               B18[i]=B[18][i];
               B19[i]=B[19][i];
               B20[i]=B[20][i];
               B21[i]=B[21][i];
               B22[i]=B[22][i];
               B23[i]=B[23][i];
               B24[i]=B[24][i];
               B25[i]=B[25][i];
               B26[i]=B[26][i];
               B27[i]=B[27][i];
               B28[i]=B[28][i];
               B29[i]=B[29][i];
              }
           }
        }
     }


//for(int x=CorBars;x>0;x--)
//   {
////B30[x]=B[30][x]; 
////B31[x]=B[31][x];
////B28[x]=B[30][x];    
////B28[x]=B[31][x];    
////B28[x]=B[32][x];    
////B28[x]=B[33][x];    
////B28[x]=B[34][x];    
////B28[x]=B[35][x];    
////B28[x]=B[36][x];    
////B28[x]=B[37][x];    
////B28[x]=B[38][x];    
////B28[x]=B[39][x];    
////B28[x]=B[40][x];    
//}
  }
//+------------------------------------------------------------------+
//| DeletCharts2                                                                 |
//+------------------------------------------------------------------+
void DeletCharts2(int numRow)
  {

   for(int i=CorBars;i>0;i--)
     {
        {
           {
            //if(symbol==SymbolName(a,true))
            B[numRow][i]=EMPTY_VALUE;

            B0[i]=B[0][i];
            B1[i]=B[1][i];
            B2[i]=B[2][i];
            B3[i]=B[3][i];
            B4[i]=B[4][i];
            B5[i]=B[5][i];
            B6[i]=B[6][i];
            B7[i]=B[7][i];
            B8[i]=B[8][i];
            B9[i]=B[9][i];
            B10[i]=B[10][i];
            B11[i]=B[11][i];
            B12[i]=B[12][i];
            B13[i]=B[13][i];
            B14[i]=B[14][i];
            B15[i]=B[15][i];
            B16[i]=B[16][i];
            B17[i]=B[17][i];
            B18[i]=B[18][i];
            B19[i]=B[19][i];
            B20[i]=B[20][i];
            B21[i]=B[21][i];
            B22[i]=B[22][i];
            B23[i]=B[23][i];
            B24[i]=B[24][i];
            B25[i]=B[25][i];
            B26[i]=B[26][i];
            B27[i]=B[27][i];
            B28[i]=B[28][i];
            B29[i]=B[29][i];

           }
        }
     }

////if(symbol==SymbolName(a,true))
//  { 
//  for(int x=CorBars;x>0;x--)
//   {
//
////B30[x]=B[30][x]; 
////B31[x]=B[31][x];
////B28[x]=B[30][x];    
////B28[x]=B[31][x];    
////B28[x]=B[32][x];    
////B28[x]=B[33][x];    
////B28[x]=B[34][x];    
////B28[x]=B[35][x];    
////B28[x]=B[36][x];    
////B28[x]=B[37][x];    
////B28[x]=B[38][x];    
////B28[x]=B[39][x];    
////B28[x]=B[40][x];    

//}
//  }
  }
//+------------------------------------------------------------------+
//| DeletCharts3                                                                 |
//+------------------------------------------------------------------+
void DeletCharts3(string currency)
  {
   for(int a=30;a>=0;a--)
      for(int i=CorBars;i>0;i--)
        {
           {
              {
               if(currency==StringSubstr(SymbolName(a,true),3,3) || currency==StringSubstr(SymbolName(a,true),0,3))
                  B[a][i]=EMPTY_VALUE;

               B0[i]=B[0][i];
               B1[i]=B[1][i];
               B2[i]=B[2][i];
               B3[i]=B[3][i];
               B4[i]=B[4][i];
               B5[i]=B[5][i];
               B6[i]=B[6][i];
               B7[i]=B[7][i];
               B8[i]=B[8][i];
               B9[i]=B[9][i];
               B10[i]=B[10][i];
               B11[i]=B[11][i];
               B12[i]=B[12][i];
               B13[i]=B[13][i];
               B14[i]=B[14][i];
               B15[i]=B[15][i];
               B16[i]=B[16][i];
               B17[i]=B[17][i];
               B18[i]=B[18][i];
               B19[i]=B[19][i];
               B20[i]=B[20][i];
               B21[i]=B[21][i];
               B22[i]=B[22][i];
               B23[i]=B[23][i];
               B24[i]=B[24][i];
               B25[i]=B[25][i];
               B26[i]=B[26][i];
               B27[i]=B[27][i];
               B28[i]=B[28][i];
               B29[i]=B[29][i];
              }
           }
        }

//if(symbol==SymbolName(a,true))
//  { 
//  for(int x=CorBars;x>0;x--)
//   {
//
////B30[x]=B[30][x]; 
////B31[x]=B[31][x];
////B28[x]=B[30][x];    
////B28[x]=B[31][x];    
////B28[x]=B[32][x];    
////B28[x]=B[33][x];    
////B28[x]=B[34][x];    
////B28[x]=B[35][x];    
////B28[x]=B[36][x];    
////B28[x]=B[37][x];    
////B28[x]=B[38][x];    
////B28[x]=B[39][x];    
////B28[x]=B[40][x];    

//}
//  }
  }
//+------------------------------------------------------------------+
//| BigestPrice                                                                 |
//+------------------------------------------------------------------+
double BigestPrice()
  {
   double Bprice=0;
   for(int y=0;y<=rowsMW;y++)
     {
      if(Bprice<iClose(SymbolName(y,true),PERIOD_CURRENT,CorBars))
         Bprice=iClose(SymbolName(y,true),PERIOD_CURRENT,CorBars);
     }

   return Bprice;

  }
//+------------------------------------------------------------------+
//|OnChartEvent                                                                  |
//+------------------------------------------------------------------+
void OnChartEvent(const int id,
                  const long &lparam,
                  const double &dparam,
                  const string &sparam)

  {
   for(int row=0; row<30;row++)
     {
      if(sparam=="DrawAll+")
        {
         DrawCharts();
        }
        
      else
      if(sparam=="DrawAll-")
        {
         DeletCharts();
        }

      else
      if(sparam==symbols[row])
        {
         ChartSetSymbolPeriod(ChartFirst(),symbols[row],PERIOD_CURRENT);

        }
      else
      if(sparam==symbols[row]+"+")
        {
         DrawCharts2(row);

        }
      else
      if(sparam==symbols[row]+"-")
        {
         DeletCharts2(row);

        }
      else
      if(row<9)
        {
         if(sparam==CurrencyName[row]+"c+")
           {
            DrawCharts3(CurrencyName[row]);

           }
         else
         if(sparam==CurrencyName[row]+"c-")
           {
            DeletCharts3(CurrencyName[row]);

           }
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
//+------------------------------------------------------------------+
