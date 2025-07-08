@echo off
:: Check if a folder was dragged and dropped onto the batch file
if "%~1"=="" (
    echo Please drag and drop a folder onto this script.
    pause
    exit /b
)

:: Change directory to the dropped folder
cd /d "%~1"

:: Confirm the current directory
echo Current directory: %cd%

:: Process all .tsv files in the folder
:: First loop
echo Processing first loop...

for %%f in (*.tsv) do (
    :: Check if the file name contains "protein"
    echo %%f | find /i "protein" >nul && (
        echo %%f | find /i "imput" >nul && (
            :: Rename to "Protein_Imputed.tsv"
            copy "%%f" "Protein_Imputed.tsv"
        ) || (
            :: Rename to "Protein.tsv"
            copy "%%f" "Protein.tsv"
        )
    )
)

:: Second loop
echo Processing second loop...

for %%f in (*.tsv) do (
 		:: Check if the file name contains "protein"
		echo %%f | find /i "precursor" >nul && (
		echo %%f | find /i "imput" >nul && (
		:: Rename to "Precursor_Imputed.tsv"
		 copy "%%f" "Precursor_Imputed.tsv"
		 ) || (
		:: Rename to "Precursor.tsv"
		copy "%%f" "Precursor.tsv"
		 )
		 )
)

