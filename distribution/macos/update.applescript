on run
	set appPath to POSIX path of (path to me)
	set packageDir to do shell script "dirname " & quoted form of appPath
	set scriptPath to packageDir & "/update.sh"
	tell application "Terminal"
		activate
		do script "bash " & quoted form of scriptPath
	end tell
end run
