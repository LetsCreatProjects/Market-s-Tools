//+------------------------------------------------------------------+
//|                                             CandleCloseBBind.mq4 |
//+------------------------------------------------------------------+
#property indicator_chart_window
#property indicator_buffers 2

#property indicator_color1 Red  
#property indicator_color2 Green

#property indicator_width1 1
#property indicator_width2 1
//----

//----

double upArrow[];
double downArrow[];
//----

double upper[];
double lower[];


int atr;
double pips,lowerBB1,upperBB1,lowerBB2,upperBB2,open,close,shift,movingE,lowest,highest,lowestMovingE=10000,highestMovingE=0;
int low,hight,counter=0;

//+------------------------------------------------------------------+
//| Expert initialization f//+------------------------------------------------------------------+unction                                   |

int OnInit()
  {
//---
        pips=MarketInfo(Symbol(),MODE_POINT);
        if(Symbol()=="XAUUSD")
           pips=MarketInfo(Symbol(),MODE_POINT)*10;
//----
   SetIndexBuffer(0,downArrow);
   SetIndexArrow (0,226);
   SetIndexStyle (0,DRAW_ARROW);
   SetIndexLabel (0,"downArrow");
//----
   SetIndexBuffer(1,upArrow);
   SetIndexStyle (1,DRAW_ARROW);
   SetIndexArrow (1,225);
   SetIndexLabel (1,"upArrow");
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
int start()  
{
//---
static int check1;
int Counted_bars; 
Counted_bars=IndicatorCounted();
static int i=200;
while(i>=0){

    upperBB1=iBands(NULL,0,20,1,0,PRICE_CLOSE,MODE_UPPER,i+1);
    lowerBB1=iBands(NULL,0,20,1,0,PRICE_CLOSE,MODE_LOWER,i+1);

    upperBB2=iBands(NULL,0,20,1,0,PRICE_CLOSE,MODE_UPPER,i+2);
    lowerBB2=iBands(NULL,0,20,1,0,PRICE_CLOSE,MODE_LOWER,i+2);

//for down move
      if(Open[i+2]>upperBB2 && Close[i+2]>upperBB2)
         if(Open[i+1]>upperBB1 && Close[i+1]>upperBB1)
            if(Open[i+1]-Close[i+1]>=0)
              if(Low[i+2]<Low[i+1])
                {
                downArrow[i+1]=High[i+1]+1*pips;
                check1=OrderSelect(SELECT_BY_POS,MODE_TRADES);
                if(OrderSymbol()==Symbol())
                  if(OrdersTotal()>0 && OrderType()==OP_SELL && counter>0 && i==1)
                    {Alert("CandleCloseBBind ask if you Can you make a Trade? "+counter+" "+Symbol());counter=counter-1;}
                } 
//for up move               
       if(Open[i+2]<lowerBB2 && Close[i+2]<lowerBB2)
         if(Open[i+1]<lowerBB1 && Close[i+1]<lowerBB1)
            if(Open[i+1]-Close[i+1]<=0)
              if(High[i+2]>High[i+1])
                {
                upArrow[i+1]=Low[i+1]-1*pips;     
                check1=OrderSelect(SELECT_BY_POS,MODE_TRADES);
                if(OrderSymbol()==Symbol())
                   if(OrdersTotal()>0 && OrderType()==OP_BUY && counter>0 && i==1)
                      {Alert("CandleCloseBBind ask if you Can you make a Trade? "+counter+" "+Symbol());counter=counter-1;}
                }
      i--;         
}
i=Bars-Counted_bars-1; 
counter=5;
 return(0);
}