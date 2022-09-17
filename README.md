# マイクラアドオン配布所
このGithubにアドオンを配布したい場合
https://forms.gle/5MCdM42QRBsQQupt6

# マイクラ無料ダウンロード
まずこの動画を見てください
https://www.youtube.com/watch?v=MsdhIZ3v8Y0

【必須環境】大抵の個人用pcでは満たしていると思います。
・管理者権限で実行できること。
・powershellが使用可能であること。
・レジストリが変更可能であること
・コマンドプロンプトが使用可能な環境であること。
+バックアップを取れる状態であること

【このbatが変更するレジストリ↓】cmdのコマンド構文になってます。すみません。
  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDll /t "REG_EXPAND_SZ" /d "%SystemRoot%\System32\ClipSVC.dlla" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v DisableSubscription /t "REG_DWORD" /d "0" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v InactivityShutdownDelay /t "REG_DWORD" /d "300" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ProcessBiosKey /t "REG_DWORD" /d "1" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v RefreshRequired /t "REG_DWORD" /d "1" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC\Parameters" /v ServiceDllUnloadOnStop /t "REG_DWORD" /d "1" 
 
  "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v wsappx /t "REG_MULTI_SZ" /d "" 

  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TimeBrokerSvc" /v Start /t "REG_DWORD" /d "4" 

 "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Svchost" /v wsappx /t "REG_MULTI_SZ" /d clipsvc\0AppXSvc 
 
 ダウンロード
 https://onl.tw/mPbSmKa
 
