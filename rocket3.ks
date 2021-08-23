clearscreen.
wait 4.
stage.
lock throttle to 1.
set runmode to "Liftoff".
set tarlon to 90.
set tes1 to "n".
set stage1 to "y".

until runmode = "Done" {
	if alt:radar > 7000 and stage1 = "y" {
			lock throttle to 0.7.
	}
	if runmode = "Liftoff" {
		if ship:apoapsis > 136000 {
			lock throttle to 0.
			set runmode to "Coastphase1".
		}
		turn(190).
		
		if ship:stagedeltav(ship:stagenum):current < 50 {
			wait 1.
			stage.
			wait 3.
			stage.
			set stage1 to "n".
		}
	}
	else if runmode = "Coastphase1" {
		if eta:apoapsis < 24 {
			lock throttle to 1.
		}
		if ship:periapsis > 135000 {
				lock throttle to 0.
				wait 6.
				stage.
				wait 5.
				toggle ag1.
				toggle ag1.
				set runmode to "Done".
		}
	}
		
	printVesselStats().
}
sas on.

function printVesselStats {
	clearscreen.
	print "Telemetry:" at(1, 4).
	print "Altitude above sea level: " + round(ship:altitude) + "m" at(10, 5).
	print "Current apoapsis: " + round(ship:apoapsis) + "m" at (10, 6).
	print "Current periapsis: " + round(ship:periapsis) + "m" at (10, 7).
	print "Orbital velocity: " + round(ship:velocity:orbit:mag * 3.6) + "km/h" at(10, 9).
	print "Ship longitude: " + round(ship:longitude) + "º" at (10, 10).
}

function turn {
	parameter heading.
	if alt:radar < 100 {
		lock angle to 90.
		lock steering to heading(heading, angle).
	}
	if alt:radar > 2400 and alt:radar < 40000 {
		lock steering to srfprograde.
	}
	if alt:radar > 100 and alt:radar < 2400 {
		lock angle to 97 - 1.03287 * alt:radar^.4.
		lock steering to heading(heading, angle).
	}
	if alt:radar > 40000 {
		lock steering to prograde.
	}
}

