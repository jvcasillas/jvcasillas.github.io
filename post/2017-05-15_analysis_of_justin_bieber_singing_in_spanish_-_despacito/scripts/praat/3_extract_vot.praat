#########
# Loops #
#########


#
# Initial setup
# 
# - We will set up some string variables that 
#   will make it easier to program the loop 
#     - path$: the relative path to the dir 
#       where we keep the files. 
#     - outputDir$: the relative path to the 
#       dir where we want to keep the output 
#       .csv file.
# - We will also create the .csv file where 
#   the output will go. We have to include 
#   the variables we want (the column names).


# Set path to folder where files are
path$ = "../../wavs/segmented/"

# Where should the output be saved?
outputDir$ = "../../data/"

# Create output file and set header
fileappend 'outputDir$'/data.csv prefix,f1e,f2e,f1_20e,f1_35e,f1_50e,f1_65e,f1_80e,f2_20e,f2_35e,f2_50e,f2_65e,f2_80e,tle,f1a,f2a,f1_20a,f1_35a,f1_50a,f1_65a,f1_80a,f2_20a,f2_35a,f2_50a,f2_65a,f2_80a,tla,f1i,f2i,f1_20i,f1_35i,f1_50i,f1_65i,f1_80i,f2_20i,f2_35i,f2_50i,f2_65i,f2_80i,tli,cdP,cdT,votP,votT,labID'newline$'



#
# Prepare loop
#

# Go to folder where files are located, create list
Create Strings as file list: "fileList", path$ + "*.wav"

# Select the object fileList
selectObject: "Strings fileList"

# Count # of files and assign total to 'numFiles'
numFiles = Get number of strings

#
# Start loop
#

for i from 1 to numFiles

	# Select string, read in files
	select Strings fileList
	fileName$ = Get string... i
	prefix$ = fileName$ - ".wav"
	Read from file... 'path$'/'prefix$'.wav
	Read from file... 'path$'/'prefix$'.TextGrid


	# Calculate mid-point of vowel E 
	vowelEstart = Get start point: 1, 2
	vowelEend  = Get end point: 1, 3
	durationVe =  vowelEend - vowelEstart
	per20e = vowelEstart + (durationVe * 0.20)
	per35e = vowelEstart + (durationVe * 0.35)
	per50e = vowelEstart + (durationVe * 0.50)
	per65e = vowelEstart + (durationVe * 0.65)
	per80e = vowelEstart + (durationVe * 0.80)


	# Calculate vot of P 
	pClosureStart = Get start point: 2, 2
	pClosureEnd  = Get end point: 2, 3
	cdP =  (pClosureEnd - pClosureStart) * 1000

	voicingP = Get time of point... 4 1
	releaseP = Get time of point... 3 1
	votP = (voicingP - releaseP) * 1000

	# Calculate mid-point of vowel A 
	vowelAstart = Get start point: 5, 2
	vowelAend  = Get end point: 5, 3
	durationVa =  vowelAend - vowelAstart
	per20a = vowelAstart + (durationVa * 0.20)
	per35a = vowelAstart + (durationVa * 0.35)
	per50a = vowelAstart + (durationVa * 0.50)
	per65a = vowelAstart + (durationVa * 0.65)
	per80a = vowelAstart + (durationVa * 0.80)


	# Calculate mid-point of vowel i 
	vowelIstart = Get start point: 6, 2
	vowelIend  = Get end point: 6, 3
	durationVi =  vowelIend - vowelIstart
	per20i = vowelIstart + (durationVi * 0.20)
	per35i = vowelIstart + (durationVi * 0.35)
	per50i = vowelIstart + (durationVi * 0.50)
	per65i = vowelIstart + (durationVi * 0.65)
	per80i = vowelIstart + (durationVi * 0.80)


	# Calculate vot of T 
	tClosureStart = Get start point: 7, 2
	tClosureEnd  = Get end point: 7, 3
	cdT =  (pClosureEnd - pClosureStart) * 1000

	voicingT = Get time of point... 9 1
	releaseT = Get time of point... 8 1
	votT = (voicingT - releaseT) * 1000

	# Get formants
	select Sound 'prefix$'
	do ("To Formant (burg)...", 0, 5, 5500, 0.025, 50)
	f1_20e = do ("Get value at time...", 1, per20e, "Hertz", "Linear")
	f1_35e = do ("Get value at time...", 1, per35e, "Hertz", "Linear")
	f1_50e = do ("Get value at time...", 1, per50e, "Hertz", "Linear")	
	f1_65e = do ("Get value at time...", 1, per65e, "Hertz", "Linear")
	f1_80e = do ("Get value at time...", 1, per80e, "Hertz", "Linear")
	f2_20e = do ("Get value at time...", 2, per20e, "Hertz", "Linear")
	f2_35e = do ("Get value at time...", 2, per35e, "Hertz", "Linear")
	f2_50e = do ("Get value at time...", 2, per50e, "Hertz", "Linear")	
	f2_65e = do ("Get value at time...", 2, per65e, "Hertz", "Linear")
	f2_80e = do ("Get value at time...", 2, per80e, "Hertz", "Linear")

	vsl1e = sqrt((f1_20e - f1_35e)^2 + (f2_20e - f2_35e)^2)
	vsl2e = sqrt((f1_35e - f1_50e)^2 + (f2_35e - f2_50e)^2)
	vsl3e = sqrt((f1_50e - f1_65e)^2 + (f2_50e - f2_65e)^2)
	vsl4e = sqrt((f1_65e - f1_80e)^2 + (f2_65e - f2_80e)^2)

	tle = vsl1e + vsl2e + vsl3e + vsl4e

	f1e = (f1_20e + f1_35e + f1_50e + f1_65e + f1_80e)/5
	f2e = (f2_20e + f2_35e + f2_50e + f2_65e + f2_80e)/5

	# A 
	f1_20a = do ("Get value at time...", 1, per20a, "Hertz", "Linear")
	f1_35a = do ("Get value at time...", 1, per35a, "Hertz", "Linear")
	f1_50a = do ("Get value at time...", 1, per50a, "Hertz", "Linear")	
	f1_65a = do ("Get value at time...", 1, per65a, "Hertz", "Linear")
	f1_80a = do ("Get value at time...", 1, per80a, "Hertz", "Linear")
	f2_20a = do ("Get value at time...", 2, per20a, "Hertz", "Linear")
	f2_35a = do ("Get value at time...", 2, per35a, "Hertz", "Linear")
	f2_50a = do ("Get value at time...", 2, per50a, "Hertz", "Linear")	
	f2_65a = do ("Get value at time...", 2, per65a, "Hertz", "Linear")
	f2_80a = do ("Get value at time...", 2, per80a, "Hertz", "Linear")

	vsl1a = sqrt((f1_20a - f1_35a)^2 + (f2_20a - f2_35a)^2)
	vsl2a = sqrt((f1_35a - f1_50a)^2 + (f2_35a - f2_50a)^2)
	vsl3a = sqrt((f1_50a - f1_65a)^2 + (f2_50a - f2_65a)^2)
	vsl4a = sqrt((f1_65a - f1_80a)^2 + (f2_65a - f2_80a)^2)

	tla = vsl1a + vsl2a + vsl3a + vsl4a

	f1a = (f1_20a + f1_35a + f1_50a + f1_65a + f1_80a)/5
	f2a = (f2_20a + f2_35a + f2_50a + f2_65a + f2_80a)/5

	# i 
	f1_20i = do ("Get value at time...", 1, per20i, "Hertz", "Linear")
	f1_35i = do ("Get value at time...", 1, per35i, "Hertz", "Linear")
	f1_50i = do ("Get value at time...", 1, per50i, "Hertz", "Linear")	
	f1_65i = do ("Get value at time...", 1, per65i, "Hertz", "Linear")
	f1_80i = do ("Get value at time...", 1, per80i, "Hertz", "Linear")
	f2_20i = do ("Get value at time...", 2, per20i, "Hertz", "Linear")
	f2_35i = do ("Get value at time...", 2, per35i, "Hertz", "Linear")
	f2_50i = do ("Get value at time...", 2, per50i, "Hertz", "Linear")	
	f2_65i = do ("Get value at time...", 2, per65i, "Hertz", "Linear")
	f2_80i = do ("Get value at time...", 2, per80i, "Hertz", "Linear")

	vsl1i = sqrt((f1_20i - f1_35i)^2 + (f2_20i - f2_35i)^2)
	vsl2i = sqrt((f1_35i - f1_50i)^2 + (f2_35i - f2_50i)^2)
	vsl3i = sqrt((f1_50i - f1_65i)^2 + (f2_50i - f2_65i)^2)
	vsl4i = sqrt((f1_65i - f1_80i)^2 + (f2_65i - f2_80i)^2)

	tli = vsl1i + vsl2i + vsl3i + vsl4i

	f1i = (f1_20i + f1_35i + f1_50i + f1_65i + f1_80i)/5
	f2i = (f2_20i + f2_35i + f2_50i + f2_65i + f2_80i)/5





	# Append data to .csv file
	fileappend 'outputDir$'/data.csv 'prefix$','f1e:2','f2e:2','f1_20e:2','f1_35e:2','f1_50e:2','f1_65e:2','f1_80e:2','f2_20e:2','f2_35e:2','f2_50e:2','f2_65e:2','f2_80e:2','tle:2', 'f1a:2','f2a:2','f1_20a:2','f1_35a:2','f1_50a:2','f1_65a:2','f1_80a:2','f2_20a:2','f2_35a:2','f2_50a:2','f2_65a:2','f2_80a:2','tla:2', 'f1i:2','f2i:2','f1_20i:2','f1_35i:2','f1_50i:2','f1_65i:2','f1_80i:2','f2_20i:2','f2_35i:2','f2_50i:2','f2_65i:2','f2_80i:2','tli:2', 'cdP:2','cdT:2','votP:2','votT:2','labID$''newline$'

	# Printline for bug fixes (comment out for speed)
	printline 'prefix$','f1e:2','f2e:2','f1_20e:2','f1_35e:2','f1_50e:2','f1_65e:2','f1_80e:2','f2_20e:2','f2_35e:2','f2_50e:2','f2_65e:2','f2_80e:2','tle:2','f1a:2','f2a:2','f1_20a:2','f1_35a:2','f1_50a:2','f1_65a:2','f1_80a:2','f2_20a:2','f2_35a:2','f2_50a:2','f2_65a:2','f2_80a:2','tla:2','f1i:2','f2i:2','f1_20i:2','f1_35i:2','f1_50i:2','f1_65i:2','f1_80i:2','f2_20i:2','f2_35i:2','f2_50i:2','f2_65i:2','f2_80i:2','tli:2','cdP:2','cdT:2','votP:2','votT:2','labID$'

	# Clean up
	select all
	minus Strings fileList
	Remove
endfor

# Clean objects
select all
Remove

