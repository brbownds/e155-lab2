if {[catch {

# define run engine funtion
source [file join {C:/lscc/radiant/2024.2} scripts tcl flow run_engine.tcl]
# define global variables
global para
set para(gui_mode) "1"
set para(prj_dir) "C:/Users/brbownds/Documents/e155_lab2"
if {![file exists {C:/Users/brbownds/Documents/e155_lab2/lab2_bb}]} {
  file mkdir {C:/Users/brbownds/Documents/e155_lab2/lab2_bb}
}
cd {C:/Users/brbownds/Documents/e155_lab2/lab2_bb}
# synthesize IPs
# synthesize VMs
# synthesize top design
file delete -force -- e155_lab2_lab2_bb.vm e155_lab2_lab2_bb.ldc
::radiant::runengine::run_engine_newmsg synthesis -f "C:/Users/brbownds/Documents/e155_lab2/lab2_bb/e155_lab2_lab2_bb_lattice.synproj" -logfile "e155_lab2_lab2_bb_lattice.srp"
::radiant::runengine::run_postsyn [list -a iCE40UP -p iCE40UP5K -t SG48 -sp High-Performance_1.2V -oc Industrial -top -w -o e155_lab2_lab2_bb_syn.udb e155_lab2_lab2_bb.vm] [list e155_lab2_lab2_bb.ldc]

} out]} {
   ::radiant::runengine::runtime_log $out
   exit 1
}
