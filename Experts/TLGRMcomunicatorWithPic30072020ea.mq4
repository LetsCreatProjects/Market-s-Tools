//+------------------------------------------------------------------+
//|                            TLGRMcomunicatorWithPic30072020ea.mq4 |
//+------------------------------------------------------------------+
//|                            TLGRMcomunicatorWithPic29072020ea.mq4 |
//+------------------------------------------------------------------+
//|                            TLGRMcomunicatorWithPic22062020ea.mq5 |
//+------------------------------------------------------------------+
//|                                                         T5ea.mq5 |
//+------------------------------------------------------------------+
//|                                TelegramComunicator22062020ea.mq4 |
//+------------------------------------------------------------------+
//|                                                         T2ea.mq4 |
//|                                                                  |
//+------------------------------------------------------------------+
#property copyright "Copyright 2017, MetaQuotes Software Corp."
#property link      "https://www.mql5.com"
#property version   "1.00"
#property strict
#include <Telegram.mqh>

input string Token = "1102567309:AAGt-Sg6FVjthlRzPL2_peZYESgKnbH-X6E"; // Here to put Telegram Token

CCustomBot bot;


//+------------------------------------------------------------------+
//| Expert initialization function                                   |
//+------------------------------------------------------------------+
int OnInit()
  {
//--- create timer
   EventSetTimer(5);
   
   bot.Token(Token);
   if(bot.GetMe()!=0)
     {
      Print("Bot initialization error");
      return INIT_FAILED;
     }
   
//---
   return(INIT_SUCCEEDED);
  }
//+------------------------------------------------------------------+
//| Expert deinitialization function                                 |
//+------------------------------------------------------------------+
void OnDeinit(const int reason)
  {
//--- destroy timer
   EventKillTimer();
   
  }
//+------------------------------------------------------------------+
//| Expert tick function                                             |
//+------------------------------------------------------------------+
void OnTick()
  {
//---
   
  }
//+------------------------------------------------------------------+
//| Timer function                                                   |
//+------------------------------------------------------------------+
void OnTimer()
  {
//---
   
   bot.GetUpdates(); 
   for(int i=0; i<bot.ChatsTotal(); i++)
     {
      CCustomChat *chat=bot.m_chats.GetNodeAtIndex(i);
      if(!chat.m_new_one.done)
        {
         chat.m_new_one.done=true;
         string text=chat.m_new_one.message_text;

//Option to add additional commands
         //if(text=="/start")
         //  {
         //    bot.SendMessage(chat.m_id,"");
         //  }

         if(text=="/update")
           {
            bot.SendMessage(chat.m_id,"ACC equity = "+string(AccountEquity())+"  " + Symbol() + " Total Orders and positions = " + string(OrdersTotal()) );
            SendScreenShot(chat.m_id,Symbol(),PERIOD_CURRENT,1000,600,true,Token);
           }
        }
     }
  }
//+------------------------------------------------------------------+
//+------------------------------------------------------------------+
//| SendScreenShot                                                                 |
//+------------------------------------------------------------------+
int SendScreenShot(const long _chat_id,
			const string _symbol,
			const ENUM_TIMEFRAMES _period,
				int x_axis,
				int y_axis,
				bool current_chart,
				string token)
{
//CCustomBot bot;
bot.Token(token);

int result=0;
long chart_id;
if(!current_chart)
chart_id=ChartOpen(_symbol,_period);
else
chart_id=ChartID();

if(chart_id==0)
return(ERR_CHART_NOT_FOUND);

if(!current_chart)
ChartSetInteger(ChartID(),CHART_BRING_TO_TOP,true);

//--- updates chart
int wait=60;
while(--wait>0)
{
if(SeriesInfoInteger(_symbol,_period,SERIES_SYNCHRONIZED))
	break;
Sleep(500);
}
string filename;
if(!current_chart)
{
ChartRedraw(chart_id);
Sleep(500);
ChartSetInteger(chart_id,CHART_SHOW_GRID,false);
ChartSetInteger(chart_id,CHART_SHOW_PERIOD_SEP,false);
filename=StringFormat("%s%d.gif",_symbol,_period);
}
else
{
	filename=StringFormat("%s%d.gif",Symbol(),Period());
}

if(FileIsExist(filename))
FileDelete(filename);

if(!current_chart)
ChartRedraw(chart_id);

Sleep(100);

if(ChartScreenShot(chart_id,filename,x_axis,y_axis,ALIGN_RIGHT))
{
Sleep(100);

bot.SendChatAction(_chat_id,ACTION_UPLOAD_PHOTO);

//--- waitng 30 sec for save screenshot
wait=60;
while(!FileIsExist(filename) && --wait>0)
	Sleep(500);

//---
if(FileIsExist(filename))
	{
	string screen_id;
	result=bot.SendPhoto(screen_id,_chat_id,filename,_symbol+"_"+StringSubstr(EnumToString(_period),7));
	}

}

if(!current_chart)
ChartClose(chart_id);

return(result);
}