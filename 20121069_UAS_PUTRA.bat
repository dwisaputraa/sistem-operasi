@echo off

:login
    set /p user="Masukan Username   : "

    if %user% == PUTRA (
        goto :menu
    ) else (
        cls
        echo Inputan Anda Salah !!!
        goto :login
    )


:menu
    cls
    color 0B
    echo.
    echo (------------------------------------------------------)
    echo                      Daftar Menu
    echo (------------------------------------------------------)
    echo.
    echo    [1] Penilaian Mahasiswa
    echo    [2] Aplikasi Perhitungan
    echo    [3] Menu Perbaikan Komputer
    echo    [4] Menu Jaringan Komputer
    echo    [5] Menu Aplikasi
    echo    [6] Menu Setting
    echo    [7] Makanan Nusantara
    echo.
    echo (------------------------------------------------------)
    echo.

    set /p pilihan="Pilihan Anda : "

    if %pilihan%==1 (
        goto akademik
    ) else if %pilihan%==2 (
        goto perhitungan
    ) else if %pilihan%==3 (
        goto perbaikan
    ) else if %pilihan%==4 (
        goto jaringan
    ) else if %pilihan%==5 (
        goto aplikasi
    ) else if %pilihan%==6 (
        goto setting
    ) else if %pilihan%==7 (
        goto makanan Nusantara
    ) else (
        goto menu
    )

:makanan
    cls
    echo.
    echo sate
    echo gudeg
    
    set /p makan=pilih makanan:
    if %makan%==1 echo pergi ke warung sate & pause
    if %makan%==2 echo pergi ke warung gudeg & pause
    echo.
    pause
        if %input%==x (
            goto menu
        ) else (
            goto loop
        )

:: menu
:akademik
    cls
    color 1F
    setlocal enabledelayedexpansion

    set /p nim="NIM   : "
    set /p nama="Nama  : "
    set /p kelas="Kelas : "
    set /p prodi="Prodi : "
    cls

    set mata_kuliah[1]=Kewirausahaan                & set sks[1]=2
    set mata_kuliah[2]=Etika Profesi                & set sks[2]=2
    set mata_kuliah[3]=Manajemen Jaringan           & set sks[3]=2
    set mata_kuliah[4]=Sistem Operasi               & set sks[4]=2
    set mata_kuliah[5]=Probabilitas Statistik       & set sks[5]=3
    set mata_kuliah[6]=Manajemen Basis Data         & set sks[6]=3
    set mata_kuliah[7]=Rekayasa Perangkat Lunak     & set sks[7]=3
    set mata_kuliah[8]=Pemrograman Objek            & set sks[8]=4

    :: Menginput nilai
    for /L %%i in (1,1,8) do (
        echo Mata Kuliah  : !mata_kuliah[%%i]!
        echo SKS          : !sks[%%i]!

        set /p nilai[%%i]="Nilai        : "
        echo.
        
        if !nilai[%%i]! geq 81 ( if !nilai[%%i]! leq 100 ( set grade[%%i]=A  & set bobot[%%i]=4.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] )) 
        if !nilai[%%i]! geq 76 ( if !nilai[%%i]! leq 80  ( set grade[%%i]=AB & set bobot[%%i]=3.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 71 ( if !nilai[%%i]! leq 75  ( set grade[%%i]=B  & set bobot[%%i]=3.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 66 ( if !nilai[%%i]! leq 70  ( set grade[%%i]=BC & set bobot[%%i]=2.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 61 ( if !nilai[%%i]! leq 65  ( set grade[%%i]=C  & set bobot[%%i]=2.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 56 ( if !nilai[%%i]! leq 60  ( set grade[%%i]=CD & set bobot[%%i]=1.50 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 51 ( if !nilai[%%i]! leq 55  ( set grade[%%i]=D  & set bobot[%%i]=1.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))
        if !nilai[%%i]! geq 0  ( if !nilai[%%i]! leq 50  ( set grade[%%i]=E  & set bobot[%%i]=0.00 & set /a total_bobot[%%i]=sks[%%i]*bobot[%%i] ))

        set /a total_sks+=sks[%%i]
        set /a total_bobot+=total_bobot[%%i]
        
    )


    ::  Menyimpan teks ke dalam file txt
    cls
    echo. >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo    Mata Kuliah                     SKS     Nilai   Grade   Bobot     >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo. >> %nim%_%nama%.txt
    for /L %%i in (1,1,8) do (
        echo    !mata_kuliah[%%i]!    !sks[%%i]!        !nilai[%%i]!      !grade[%%i]!   !bobot[%%i]! >> %nim%_%nama%.txt
    )
    echo. >> %nim%_%nama%.txt
    echo [==================================================================] >> %nim%_%nama%.txt
    echo. >> %nim%_%nama%.txt

    echo    NIM          :  %nim%          >> %nim%_%nama%.txt
    echo    Nama         :  %nama%         >> %nim%_%nama%.txt
    echo    Kelas        :  %kelas%        >> %nim%_%nama%.txt
    echo    Prodi        :  %prodi%        >> %nim%_%nama%.txt
    echo    Total SKS    :  %total_sks%    >> %nim%_%nama%.txt
    echo    Total Bobot  :  %total_bobot%  >> %nim%_%nama%.txt

    set /a ip=%total_bobot%/%total_sks%
    echo    IP           :  %ip%           >> %nim%_%nama%.txt

    echo Data Berhasil Disimpan . . .
    echo.
    pause


    ::  Menampilkan isi file 
    type %nim%_%nama%.txt
    echo.
    pause
    goto menu


    endlocal


:perhitungan
    cls
    color A0
    echo.
    echo [=====================================================]
    echo                Kalkulator Sederhana
    echo               Ketik [x] Untuk Kembali
    echo [=====================================================]
    echo.
    :loop
        set /p input=
        set /a hasil=%input%
        echo %hasil%
        echo.

        if %input%==x (
            goto menu
        ) else (
            goto loop
        )

:perbaikan
    cls
    color 1E
    echo.
    echo [========================================================]
    echo                 Menu Perbaikan Komputer
    echo [========================================================]
    echo.
    echo    [1] Masalah Audio
    echo    [2] Masalah Koneksi Internet
    echo    [3] Masalah Printer
    echo    [4] Masalah Bluetooth
    echo    [b] Kembali    [x] Keluar
    echo.
    echo [========================================================]
    echo.

    set /p perbaikan="Pilihan Anda : "

    if %perbaikan%==1 (
        start msdt.exe -id AudioPlaybackDiagnostic
    ) else if %perbaikan%==2 (
        start msdt.exe -id NetworkDiagnosticsWeb
    ) else if %perbaikan%==3 (
        start msdt.exe -id PrinterDiagnostic
    ) else if %perbaikan%==4 (
        start msdt.exe -id BluetoothDiagnostic
    ) else if %perbaikan%==b (
        goto menu
    ) else if %perbaikan%==x (
        echo Bye
        exit
    ) else (
        goto perbaikan
    )
    
    goto perbaikan
    

:jaringan
    cls
    color B0
    echo.
    echo [==================================================]
    echo                Menu Jaringan Komputer
    echo [==================================================]
    echo.
    echo    [1] Pengaturan Jaringan
    echo    [2] Tampilkan Alamat IP
    echo    [3] Periksa Koneksi Jaringan
    echo    [b] Kembali     [x] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p jaringan="Pilihan Anda : "

    if %jaringan%==1 (
        start ms-settings:network
    ) else if %jaringan%==2 (
        echo Menampilkan alamat IP...
        ipconfig
        pause
    ) else if %jaringan%==3 (
        echo Memeriksa koneksi jaringan...
        ping -n 4 8.8.8.8
        pause
    ) else if %jaringan%==b (
        goto menu
    ) else if %jaringan%==x (
        echo Bye
        exit 
    ) else (
        goto jaringan
    )

    goto jaringan


:aplikasi
    cls
    color F3
    echo.
    echo [==================================================]
    echo                     Menu Aplikasi
    echo [==================================================]
    echo.
    echo    [1] Microsoft Office
    echo    [2] Google Chrome
    echo    [3] Notepad
    echo    [4] File Explorer
    echo    [b] Kembali     [x] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p aplikasi="Pilihan Anda : "

    if %aplikasi%==1 (
        goto aplikasi1
    ) else if %aplikasi%==2 (
        goto aplikasi2
    ) else if %aplikasi%==3 (
        goto aplikasi3
    ) else if %aplikasi%==4 (
        goto aplikasi4
    ) else if %aplikasi%==b (
        goto menu
    ) else if %aplikasi%==x (
        echo Bye
        exit
    ) else (
        goto aplikasi
    )

    :aplikasi1
        cls
        echo.
        echo [=================================================]
        echo                Microsoft Office
        echo [=================================================]
        echo.
        echo    [1] Microsoft Word
        echo    [2] Microsoft Power Point
        echo    [3] Microsoft Excel
        echo    [b] Kembali       [x] Exit
        echo.
        echo [=================================================]
        echo.

        set /p microsoft="Pilihan Anda : "

        if %microsoft%==1 (
            start Winword.exe
        ) else if %microsoft%==2 (
            start powerpnt.exe
        ) else if %microsoft%==3 (
            start Excel.exe
        ) else if %microsoft%==b (
            goto aplikasi
        ) else if %microsoft%==x (
            echo Bye
            exit
        ) else (
            goto aplikasi1
        )

        goto aplikasi1


    :aplikasi2
        "C:\Program Files\Google\Chrome\Application\chrome.exe"
        goto aplikasi

    :aplikasi3
        start Notepad.exe
        goto aplikasi
        
    :aplikasi4
        start explorer.exe
        goto aplikasi


:setting
    cls
    color 0A
    echo.
    echo [==================================================]
    echo                     Menu Setting
    echo [==================================================]
    echo.
    echo    [1] Pengaturan Sistem
    echo    [2] Shutdown
    echo    [3] Restart
    echo    [b] Kembali     [x] Keluar
    echo.
    echo [==================================================]
    echo.

    set /p setting="Pilihan Anda : "

    if %setting%==1 (
        start ms-settings:system
    ) else if %setting%==2 (
        shutdown /s /f /t 0
    ) else if %setting%==3 (
        shutdown /r /t 0
    ) else if %setting%==b (
        goto menu
    ) else if %setting%==x (
        echo Bye
        exit
    ) else (
        goto setting
    )

    goto setting


:exit
    echo Bye
    exit