" Vim syntax file
" Language:	SystemVerilog (superset extension of Verilog)

" Extends Verilog syntax
" Requires $VIMRUNTIME/syntax/verilog.vim to exist

" For version 5.x: Clear all syntax items
" For version 6.x: Quit when a syntax file was already loaded
if version < 600
   syntax clear
elseif exists("b:current_syntax")
   finish
endif

" Override 'iskeyword'
if version >= 600
   setlocal iskeyword=@,48-57,_,192-255
else
   set iskeyword=@,48-57,_,192-255
endif

" Store cpoptions
let oldcpo=&cpoptions
set cpo-=C

syn sync lines=1000

"##########################################################
"       SystemVerilog Syntax
"##########################################################

syn keyword verilogStatement   always and assign buf
syn keyword verilogStatement   bufif0 bufif1 cell cmos
syn keyword verilogStatement   config deassign defparam design
syn keyword verilogStatement   disable edge endconfig chandle
syn keyword verilogStatement   endgenerate
syn keyword verilogStatement   endprimitive endtable
syn keyword verilogStatement   event force fork join
syn keyword verilogStatement   join_any join_none forkjoin
syn keyword verilogStatement   generate genvar highz0 highz1 ifnone
syn keyword verilogStatement   incdir include initial
syn keyword verilogStatement   instance  large liblist
syn keyword verilogStatement   library localparam macromodule medium
syn keyword verilogStatement   nand negedge nmos nor
syn keyword verilogStatement   noshowcancelled not notif0 notif1 or
syn keyword verilogStatement   parameter pmos posedge primitive
syn keyword verilogStatement   pull0 pull1 pulldown pullup
syn keyword verilogStatement   pulsestyle_onevent pulsestyle_ondetect
syn keyword verilogStatement   rcmos release
syn keyword verilogStatement   rnmos rpmos rtran rtranif0 rtranif1
syn keyword verilogStatement   scalared showcancelled signed small
syn keyword verilogStatement   specparam strong0 strong1
syn keyword verilogStatement   supply0 supply1 table time tran
syn keyword verilogStatement   tranif0 tranif1 tri tri0 tri1 triand
syn keyword verilogStatement   trior trireg unsigned use vectored wait
syn keyword verilogStatement   wand weak0 weak1  wor xnor xor
syn keyword verilogStatement   semaphore mailbox
syn keyword verilogStatement   always_comb always_ff always_latch
syn keyword verilogStatement   checker endchecker
syn keyword verilogStatement   package endpackage
syn keyword verilogStatement   constraint randomize
syn keyword verilogStatement   with inside dist
syn keyword verilogStatement   randcase
syn keyword verilogStatement   randsequence
syn keyword verilogStatement   get_randstate set_randstate
syn keyword verilogStatement   srandom
syn keyword verilogStatement   struct packed
syn keyword verilogStatement   final
syn keyword verilogStatement   import
syn keyword verilogStatement   context
syn keyword verilogStatement   modport
syn keyword verilogStatement   cover coverpoint
syn keyword verilogStatement   program endprogram
syn keyword verilogStatement   bins binsof illegal_bins ignore_bins
syn keyword verilogStatement   alias matches solve assert
syn keyword verilogStatement   assume before expect bind
syn keyword verilogStatement   extends tagged extern
syn keyword verilogStatement   first_match throughout timeprecision
syn keyword verilogStatement   timeunit priority type union
syn keyword verilogStatement   cross wait_order intersect
syn keyword verilogStatement   wildcard within
syn keyword verilogStatement   triggered
syn keyword verilogStatement   std
syn keyword verilogStatement   accept_on eventually global implements implies
syn keyword verilogStatement   interconnect let nettype nexttime reject_on restrict
syn keyword verilogStatement   s_always s_eventually s_nexttime s_until s_until_with
syn keyword verilogStatement   strong sync_accept_on sync_reject_on unique unique0
syn keyword verilogStatement   until until_with untyped weak

syn keyword verilogDataType     bit byte int integer logic longint pure
syn keyword verilogDataType     rand randc wire uwire soft
syn keyword verilogDataType     real realtime reg shortint shortreal string time void
syn keyword verilogDataType     protected local const virtual
syn keyword verilogDataType     automatic static inout input output ref var

syn keyword verilogTypeDef     enum

syn keyword verilogConditional iff
syn keyword verilogConditional if else case casex casez default endcase

syn keyword verilogRepeat      forever repeat while for
syn keyword verilogRepeat      return break continue
syn keyword verilogRepeat      do while foreach

syn match   verilogDirective   "`[a-zA-Z_][a-zA-Z0-9_$]\+"
syn match   verilogGlobal      "$[a-zA-Z0-9_$]\+"

if !exists('g:verilog_disable_constant_highlight')
    syn match   verilogConstant    "\<[A-Z][A-Z0-9_$]*\>"
endif

syn match   verilogNumber      "\(\d\+\)\?'[sS]\?[bB]\s*[0-1_xXzZ?]\+"
syn match   verilogNumber      "\(\d\+\)\?'[sS]\?[oO]\s*[0-7_xXzZ?]\+"
syn match   verilogNumber      "\(\d\+\)\?'[sS]\?[dD]\s*[0-9_xXzZ?]\+"
syn match   verilogNumber      "\(\d\+\)\?'[sS]\?[hH]\s*[0-9a-fA-F_xXzZ?]\+"
syn match   verilogNumber      "\<[+-]\?[0-9_]\+\(\.[0-9_]*\)\?\(e[0-9_]*\)\?\>"
syn match   verilogNumber      "\<\d[0-9_]*\(\.[0-9_]\+\)\=\([fpnum]\)\=s\>"
syn keyword verilogNumber      1step

syn keyword verilogTodo        contained TODO FIXME

syn match   verilogOperator    "[&|~><!)(*#%@+/=?:;}{,.\^\-\[\]]"

syn region  verilogString      start=+"+ skip=+\\"+ end=+"+ contains=verilogEscape,@Spell
syn match   verilogEscape      +\\[nt"\\]+ contained
syn match   verilogEscape      "\\\o\o\=\o\=" contained

syn keyword verilogMethod      new
if v:version >= 704
    syn match   verilogMethod  "\(\(\s\|[(/]\|^\)\.\)\@2<!\<\w\+\ze#\?("
else
    syn match   verilogMethod  "\(\(\s\|[(/]\|^\)\.\)\@<!\<\w\+\ze#\?("
endif

syn match   verilogLabel       "\<\k\+\>\ze\s*:\s*\<\(assert\|assume\|cover\(point\)\?\|cross\)\>"
if v:version >= 704
    syn match   verilogLabel   "\(\<\(begin\|end\)\>\s*:\s*\)\@20<=\<\k\+\>"
else
    syn match   verilogLabel   "\(\<\(begin\|end\)\>\s*:\s*\)\@<=\<\k\+\>"
endif

syn keyword verilogObject      super null this
syn match   verilogObject      "\<\w\+\ze\(::\|\.\)" contains=verilogNumber

" https://github.com/dcblack/uvm_vim_extras/blob/master/syntax/sv.vim
syn keyword uvm_class    uvm_active_passive_enum
syn keyword uvm_class    uvm_adaptor
syn match   uvm_class    /\<uvm_analysis_imp_\w\+\s/
syn keyword uvm_class    uvm_barrier
syn keyword uvm_class    uvm_barrier_pool
syn keyword uvm_class    uvm_component
syn keyword uvm_class    uvm_configure_phase
syn keyword uvm_class    uvm_domain
syn keyword uvm_class    uvm_driver
syn keyword uvm_class    uvm_enum_wrapper
syn keyword uvm_class    uvm_env
syn keyword uvm_class    uvm_event
syn keyword uvm_class    uvm_event_base
syn keyword uvm_class    uvm_event_pool
syn keyword uvm_class    uvm_factory
syn keyword uvm_class    uvm_heartbeat
syn keyword uvm_class    uvm_heartbeat_cb
syn keyword uvm_class    uvm_in_order_built_in_comparator
syn keyword uvm_class    uvm_in_order_class_comparator
syn keyword uvm_class    uvm_in_order_comparator
syn keyword uvm_class    uvm_main_phase
syn keyword uvm_class    uvm_mem
syn keyword uvm_class    uvm_monitor
syn keyword uvm_class    uvm_object
syn keyword uvm_class    uvm_object_registry
syn keyword uvm_class    uvm_objection
syn keyword uvm_class    uvm_path_e
syn keyword uvm_class    uvm_phase
syn keyword uvm_class    uvm_task_phase
syn keyword uvm_class    uvm_topdown_phase
syn keyword uvm_class    uvm_bottomup_phase
syn keyword uvm_class    uvm_phase_cb
syn keyword uvm_class    uvm_pool
syn keyword uvm_class    uvm_port_base
syn keyword uvm_class    uvm_post_configure_phase
syn keyword uvm_class    uvm_post_main_phase
syn keyword uvm_class    uvm_post_reset_phase
syn keyword uvm_class    uvm_post_shutdown_phase
syn keyword uvm_class    uvm_pre_configure_phase
syn keyword uvm_class    uvm_pre_main_phase
syn keyword uvm_class    uvm_pre_reset_phase
syn keyword uvm_class    uvm_pre_shutdown_phase
syn keyword uvm_class    uvm_predict_e
syn keyword uvm_class    uvm_predictor
syn keyword uvm_class    uvm_printer
syn keyword uvm_class    uvm_printer_knobs
syn keyword uvm_class    uvm_push_driver
syn keyword uvm_class    uvm_push_sequencer
syn keyword uvm_class    uvm_recorder
syn keyword uvm_class    uvm_reg
syn keyword uvm_class    uvm_reg_adapter
syn keyword uvm_class    uvm_reg_backdoor
syn keyword uvm_class    uvm_reg_block
syn keyword uvm_class    uvm_reg_bus_op
syn keyword uvm_class    uvm_reg_cbs
syn keyword uvm_class    uvm_reg_field
syn keyword uvm_class    uvm_reg_item
syn keyword uvm_class    uvm_reg_map
syn keyword uvm_class    uvm_reg_predictor
syn keyword uvm_class    uvm_reg_sequence
syn keyword uvm_class    uvm_reg_transaction_order_policy
syn keyword uvm_class    uvm_report_catcher
syn keyword uvm_class    uvm_reset_phase
syn keyword uvm_class    uvm_sequence
syn keyword uvm_class    uvm_sequencer
syn keyword uvm_class    uvm_sequencer_base
syn keyword uvm_class    uvm_severity
syn keyword uvm_class    uvm_shutdown_phase
syn keyword uvm_class    uvm_test
syn keyword uvm_class    uvm_text_tr_database
syn keyword uvm_class    uvm_tlm_analysis_fifo
syn keyword uvm_class    uvm_tlm_extension
syn keyword uvm_class    uvm_tlm_extension_base
syn keyword uvm_class    uvm_tlm_fifo
syn keyword uvm_class    uvm_tlm_generic_payload
syn keyword uvm_class    uvm_tr_stream
syn keyword uvm_class    uvm_transaction
syn keyword uvm_class    uvm_scoreboard
syn keyword uvm_class    uvm_callback
syn keyword uvm_class    uvm_agent
syn keyword uvm_class    uvm_sequence_base
syn keyword uvm_class    uvm_sequence_item
syn keyword uvm_class    uvm_callbacks
syn keyword uvm_class    uvm_config_db
syn keyword uvm_class    uvm_resource_db
syn keyword uvm_class    uvm_subscriber
syn keyword uvm_class    uvm_algorithmic_comparator
syn keyword uvm_class    uvm_cmdline_processor
syn keyword uvm_class    uvm_component_registry
syn keyword uvm_class    uvm_default_line_printer
syn keyword uvm_class    uvm_default_printer
syn keyword uvm_class    uvm_default_table_printer
syn keyword uvm_class    uvm_default_tree_printer
syn keyword uvm_class    uvm_event_callback
syn keyword uvm_class    uvm_root
syn keyword uvm_class    uvm_report_server
syn keyword uvm_class    uvm_default_factory
syn keyword uvm_class    uvm_default_report_server
syn keyword uvm_class    uvm_visitor
syn keyword uvm_class    uvm_component_name_check_visitor
syn keyword uvm_class    uvm_tr_database
syn keyword uvm_class    uvm_default_coreservice_t


syn keyword uvm_data     adaptor
syn keyword uvm_data     analysis_export
syn keyword uvm_data     analysis_port
syn keyword uvm_data     bus_in
syn keyword uvm_data     enable_print_topology
syn keyword uvm_data     fld
syn keyword uvm_data     kind
syn keyword uvm_data     map
syn keyword uvm_data     p_sequencer
syn keyword uvm_data     parent phase
syn keyword uvm_data     path
syn keyword uvm_data     reg_ap
syn keyword uvm_data     req
syn keyword uvm_data     rsp
syn keyword uvm_data     rw
syn keyword uvm_data     seq_item_export
syn keyword uvm_data     seq_item_port
syn keyword uvm_data     starting_phase
syn keyword uvm_data     uvm_top
syn keyword uvm_data     value

syn keyword uvm_enum     UVM_ACTIVE
syn keyword uvm_enum     UVM_ALL_ON
syn keyword uvm_enum     UVM_BIN
syn keyword uvm_enum     UVM_CALL_HOOK
syn keyword uvm_enum     UVM_COUNT
syn keyword uvm_enum     UVM_DEC
syn keyword uvm_enum     UVM_DISPLAY
syn keyword uvm_enum     UVM_ERROR
syn keyword uvm_enum     UVM_EXIT
syn keyword uvm_enum     UVM_FATAL
syn keyword uvm_enum     UVM_INFO
syn keyword uvm_enum     UVM_LOG
syn keyword uvm_enum     UVM_NOCOMPARE
syn keyword uvm_enum     UVM_NOPRINT
syn keyword uvm_enum     UVM_NO_ACTION
syn keyword uvm_enum     UVM_PASSIVE
syn keyword uvm_enum     UVM_PRINT
syn keyword uvm_enum     UVM_RGM
syn keyword uvm_enum     UVM_STOP
syn keyword uvm_enum     UVM_WARNING

syn keyword uvm_method   add
syn keyword uvm_method   add_callback
syn keyword uvm_method   add_uvm_phases
syn keyword uvm_method   after_phase
syn keyword uvm_method   b_transport
syn keyword uvm_method   before_phase
syn keyword uvm_method   block
syn keyword uvm_method   body
syn keyword uvm_method   can_get
syn keyword uvm_method   can_peek
syn keyword uvm_method   can_put
syn keyword uvm_method   connect
syn keyword uvm_method   convert2string
syn keyword uvm_method   create
syn keyword uvm_method   default_sequence
syn keyword uvm_method   delete_callback
syn keyword uvm_method   do_compare
syn keyword uvm_method   do_copy
syn keyword uvm_method   do_global_phase
syn keyword uvm_method   do_print
syn keyword uvm_method   drop_objection
syn keyword uvm_method   dump_report_state
syn keyword uvm_method   encode decode
syn keyword uvm_method   end_prematurely
syn keyword uvm_method   find
syn keyword uvm_method   finish_item
syn keyword uvm_method   get
syn keyword uvm_method   get_adjacent_predecessor_nodes
syn keyword uvm_method   get_adjacent_successor_nodes
syn keyword uvm_method   get_child
syn keyword uvm_method   get_children
syn keyword uvm_method   get_common_domain
syn keyword uvm_method   get_depth
syn keyword uvm_method   get_first_child
syn keyword uvm_method   get_full_name
syn keyword uvm_method   get_global_pool
syn keyword uvm_method   get_is_active
syn keyword uvm_method   get_name
syn keyword uvm_method   get_next_child
syn keyword uvm_method   get_next_item
syn keyword uvm_method   get_num_children
syn keyword uvm_method   get_num_waiters
syn keyword uvm_method   get_objection
syn keyword uvm_method   get_parent
syn keyword uvm_method   get_phase_type
syn keyword uvm_method   get_sequence_path
syn keyword uvm_method   get_starting_phase
syn keyword uvm_method   get_trigger_data
syn keyword uvm_method   get_trigger_time
syn keyword uvm_method   get_type_name
syn keyword uvm_method   global_stop_request
syn keyword uvm_method   has_child
syn keyword uvm_method   is_off
syn keyword uvm_method   is_on
syn keyword uvm_method   item_done
syn keyword uvm_method   lookup
syn keyword uvm_method   max_quit_count
syn keyword uvm_method   mid_do
syn keyword uvm_method   nb_transport_bw
syn keyword uvm_method   nb_transport_fw
syn keyword uvm_method   peek
syn keyword uvm_method   post_body
syn keyword uvm_method   post_do
syn keyword uvm_method   post_predict
syn keyword uvm_method   post_read
syn keyword uvm_method   post_start
syn keyword uvm_method   post_write
syn keyword uvm_method   pre_body
syn keyword uvm_method   pre_do
syn keyword uvm_method   pre_predict
syn keyword uvm_method   pre_read
syn keyword uvm_method   pre_start
syn keyword uvm_method   pre_write
syn keyword uvm_method   print
syn keyword uvm_method   print_real
syn keyword uvm_method   print_topology
syn keyword uvm_method   put
syn keyword uvm_method   raise_objection
syn keyword uvm_method   ralgen
syn keyword uvm_method   read_by_name
syn keyword uvm_method   regfile
syn keyword uvm_method   register
syn keyword uvm_method   report_hook
syn keyword uvm_method   report_summarize
syn keyword uvm_method   reset
syn keyword uvm_method   run_test
syn keyword uvm_method   set
syn keyword uvm_method   set_automatic_phase_object
syn keyword uvm_method   set_config
syn keyword uvm_method   set_domain
syn keyword uvm_method   set_drain_time set_timeout
syn keyword uvm_method   set_global_timeout
syn keyword uvm_method   set_id_info
syn keyword uvm_method   set_inst_override_by_type
syn keyword uvm_method   set_jump_phase
syn keyword uvm_method   set_phase_imp
syn keyword uvm_method   set_propagate_mode
syn keyword uvm_method   set_report_default_file
syn keyword uvm_method   set_report_default_file_hier
syn keyword uvm_method   set_report_id_action
syn keyword uvm_method   set_report_id_action_hier
syn keyword uvm_method   set_report_id_file
syn keyword uvm_method   set_report_id_file_hier
syn keyword uvm_method   set_report_max_quit_count
syn keyword uvm_method   set_report_severity_action
syn keyword uvm_method   set_report_severity_action_hier
syn keyword uvm_method   set_report_severity_file
syn keyword uvm_method   set_report_severity_file_hier
syn keyword uvm_method   set_report_severity_id_action
syn keyword uvm_method   set_report_severity_id_action_hier
syn keyword uvm_method   set_report_severity_id_file
syn keyword uvm_method   set_report_severity_id_file_hier
syn keyword uvm_method   set_report_verbosity_level
syn keyword uvm_method   set_report_verbosity_level_hier
syn keyword uvm_method   set_starting_phase
syn keyword uvm_method   set_threshold
syn keyword uvm_method   set_type_override_by_type
syn keyword uvm_method   sprint
syn keyword uvm_method   start_item
syn keyword uvm_method   transform
syn keyword uvm_method   trigger
syn keyword uvm_method   try_get
syn keyword uvm_method   try_next_item
syn keyword uvm_method   try_peek
syn keyword uvm_method   try_put
syn keyword uvm_method   type_id
syn keyword uvm_method   uvm_analysis_export
syn keyword uvm_method   uvm_analysis_port
syn keyword uvm_method   uvm_callback_iter
syn keyword uvm_method   uvm_callbacks_objection
syn keyword uvm_method   uvm_cmdline_proc
syn keyword uvm_method   uvm_is_match
syn keyword uvm_method   uvm_line_printer
syn keyword uvm_method   uvm_objection_callback
syn keyword uvm_method   uvm_process_report_message
syn keyword uvm_method   uvm_random_stimulus
syn keyword uvm_method   uvm_report_error
syn keyword uvm_method   uvm_report_fatal
syn keyword uvm_method   uvm_report_handler
syn keyword uvm_method   uvm_report_info
syn keyword uvm_method   uvm_report_message
syn keyword uvm_method   uvm_report_object
syn keyword uvm_method   uvm_report_warning
syn keyword uvm_method   uvm_seq_item_export
syn keyword uvm_method   uvm_seq_item_port
syn keyword uvm_method   uvm_seq_item_pull_export
syn keyword uvm_method   uvm_seq_item_pull_port
syn keyword uvm_method   uvm_sequence_library
syn keyword uvm_method   uvm_sequence_library_cfg
syn keyword uvm_method   uvm_sequence_state
syn keyword uvm_method   uvm_sequencer_param_base
syn keyword uvm_method   uvm_table_printer
syn keyword uvm_method   uvm_table_printer_knobs
syn keyword uvm_method   uvm_test_done_objection
syn keyword uvm_method   uvm_tlm_if
syn keyword uvm_method   uvm_tlm_time
syn keyword uvm_method   uvm_tree_printer
syn keyword uvm_method   uvm_tree_printer_knobs
syn keyword uvm_method   wait_for
syn keyword uvm_method   wait_off
syn keyword uvm_method   wait_on
syn keyword uvm_method   wait_ptrigger
syn keyword uvm_method   wait_trigger
syn keyword uvm_method   with_phase
syn match   uvm_method   /\<write_\w\+\>/

syn keyword uvm_phase    build_phase
syn keyword uvm_phase    check_phase
syn keyword uvm_phase    configure_phase
syn keyword uvm_phase    connect_phase
syn keyword uvm_phase    define_domain
syn keyword uvm_phase    do_kill
syn keyword uvm_phase    end_of_elaboration_phase
syn keyword uvm_phase    exec_task
syn keyword uvm_phase    extract_phase
syn keyword uvm_phase    final_phase
syn keyword uvm_phase    main_phase
syn keyword uvm_phase    phase_ended
syn keyword uvm_phase    phase_ready_to_end
syn keyword uvm_phase    phase_started
syn keyword uvm_phase    post_configure_phase
syn keyword uvm_phase    post_main_phase
syn keyword uvm_phase    post_reset_phase
syn keyword uvm_phase    post_shutdown_phase
syn keyword uvm_phase    pre_configure_phase
syn keyword uvm_phase    pre_main_phase
syn keyword uvm_phase    pre_reset_phase
syn keyword uvm_phase    pre_shutdown_phase
syn keyword uvm_phase    report_phase
syn keyword uvm_phase    reset_phase
syn keyword uvm_phase    run_phase
syn keyword uvm_phase    shutdown_phase
syn keyword uvm_phase    start_of_simulation_phase

syn keyword uvm_seq      uvm_reg_bit_hash_seq
syn keyword uvm_seq      uvm_reg_hw_reset_seq
syn keyword uvm_seq      uvm_reg_mem_built_in_seq

syn match uvm_macros   "\`uvm_add_to_seq_lib"
syn match uvm_macros   "\`uvm_analysis_imp_decl"
syn match uvm_macros   "\`uvm_component_param_utils"
syn match uvm_macros   "\`uvm_component_utils"
syn match uvm_macros   "\`uvm_component_utils_begin"
syn match uvm_macros   "\`uvm_component_utils_end"
syn match uvm_macros   "\`uvm_create"
syn match uvm_macros   "\`uvm_create_on"
syn match uvm_macros   "\`uvm_create_seq"
syn match uvm_macros   "\`uvm_declare_p_sequencer"
syn match uvm_macros   "\`uvm_do"
syn match uvm_macros   "\`uvm_do_on"
syn match uvm_macros   "\`uvm_do_on_pri"
syn match uvm_macros   "\`uvm_do_on_pri_with"
syn match uvm_macros   "\`uvm_do_on_with"
syn match uvm_macros   "\`uvm_do_pri"
syn match uvm_macros   "\`uvm_do_pri_with"
syn match uvm_macros   "\`uvm_do_seq"
syn match uvm_macros   "\`uvm_do_seq_with"
syn match uvm_macros   "\`uvm_do_with"
syn match uvm_macros   "\`uvm_error"
syn match uvm_macros   "\`uvm_error_context"
syn match uvm_macros   "\`uvm_fatal"
syn match uvm_macros   "\`uvm_fatal_context"
syn match uvm_macros   "\`uvm_field_enum"
syn match uvm_macros   "\`uvm_field_int"
syn match uvm_macros   "\`uvm_info"
syn match uvm_macros   "\`uvm_info_begin"
syn match uvm_macros   "\`uvm_info_context"
syn match uvm_macros   "\`uvm_info_end"
syn match uvm_macros   "\`uvm_message_add_int"
syn match uvm_macros   "\`uvm_message_add_object"
syn match uvm_macros   "\`uvm_message_add_string"
syn match uvm_macros   "\`uvm_message_add_tag"
syn match uvm_macros   "\`uvm_object_param_utils"
syn match uvm_macros   "\`uvm_object_utils"
syn match uvm_macros   "\`uvm_object_utils_begin"
syn match uvm_macros   "\`uvm_object_utils_end"
syn match uvm_macros   "\`uvm_rand_send"
syn match uvm_macros   "\`uvm_rand_send_pri"
syn match uvm_macros   "\`uvm_rand_send_pri_with"
syn match uvm_macros   "\`uvm_rand_send_with"
syn match uvm_macros   "\`uvm_record_int"
syn match uvm_macros   "\`uvm_record_real"
syn match uvm_macros   "\`uvm_record_string"
syn match uvm_macros   "\`uvm_record_time"
syn match uvm_macros   "\`uvm_send"
syn match uvm_macros   "\`uvm_send_pri"
syn match uvm_macros   "\`uvm_sequence_library_utils"
syn match uvm_macros   "\`uvm_warning"
syn match uvm_macros   "\`uvm_warning_context"

syn match sv_directive "\`celldefine"
syn match sv_directive "\`default_nettype"
syn match sv_directive "\`define"
syn match sv_directive "\`ifdef"
syn match sv_directive "\`ifndef"
syn match sv_directive "\`elsif"
syn match sv_directive "\`else"
syn match sv_directive "\`include"
syn match sv_directive "\`unconnected_drive"
syn match sv_directive "\`pragma"
syn match sv_directive "\`resetall"
syn match sv_directive "\`timescale"
syn match sv_directive "\`undef"
syn match sv_directive "\`undefineall"

syn keyword uvm_type   uvm_reg_data_t
syn keyword uvm_type   uvm_bitstream_t
syn keyword uvm_type   uvm_integral_t
syn keyword uvm_type   uvm_objection_cbs_t
syn keyword uvm_type   uvm_coreservice_t
syn keyword uvm_type   sequencer_t
syn keyword uvm_type   uvm_status_e
syn keyword uvm_type   uvm_port_type_e

" Create syntax definition from g:verilog_syntax dictionary
function! s:SyntaxCreate(name, verilog_syntax)
    if exists('a:verilog_syntax[a:name]')
        let verilog_syn_region_name = 'verilog'.substitute(a:name, '.*', '\u&', '')
        for entry in a:verilog_syntax[a:name]
            if exists('entry["match"]')
                " syn-match definitions
                let match = entry["match"]
                let verilog_syn_match_cmd = 'syn match '.verilog_syn_region_name.' "'.match.'"'

                if exists('entry["syn_argument"]')
                    let verilog_syn_match_cmd .= ' '.entry["syn_argument"]
                endif

                execute verilog_syn_match_cmd
            elseif exists('entry["match_start"]') && exists('entry["match_end"]')
                " syn-region definitions

                let region_start = entry["match_start"]
                let region_end = entry["match_end"]

                if verilog_systemverilog#VariableExists('verilog_quick_syntax')
                    execute 'syn keyword verilogStatement '.region_start.' '.region_end
                else
                    let verilog_syn_region_cmd = 'syn region '.verilog_syn_region_name

                    if exists('entry["highlight"]')
                        let verilog_syn_region_cmd .= ' matchgroup='.entry["highlight"]
                    endif

                    let verilog_syn_region_cmd .=
                        \  ' start="'.region_start.'"'
                        \ .' end="'.region_end.'"'

                    " Always skip inline comments
                    if a:name != "comment" && exists('a:verilog_syntax["comment"]')
                        let verilog_syn_region_cmd .= ' skip="'
                        for comment_entry in a:verilog_syntax["comment"]
                            if exists('comment_entry["match"]')
                                let verilog_syn_region_cmd .= comment_entry["match"]
                            endif
                        endfor
                        let verilog_syn_region_cmd .= '"'
                    endif

                    if exists('entry["syn_argument"]')
                        let verilog_syn_region_cmd .= ' '.entry["syn_argument"]
                    endif

                    if !exists('entry["no_fold"]')
                        if (index(s:verilog_syntax_fold, a:name) >= 0 || index(s:verilog_syntax_fold, "all") >= 0)
                            let verilog_syn_region_cmd .= ' fold'
                        endif
                    endif

                    execute verilog_syn_region_cmd
                endif
            elseif exists('entry["cluster"]')
                " syn-cluster definitions

                execute 'syn cluster '.verilog_syn_region_name.' contains='.entry["cluster"]
            elseif exists('entry["keyword"]')
                " syn-cluster definitions

                execute 'syn keyword '.verilog_syn_region_name.' '.entry["keyword"]
            else
                echoerr 'Incorrect syntax defintion for '.a:name
            endif
        endfor
    end
endfunction

" Only enable folding if verilog_syntax_fold_lst is defined
let s:verilog_syntax_fold=verilog_systemverilog#VariableGetValue("verilog_syntax_fold_lst")

" Syntax priority list
" TURN OFF define, expression
 let s:verilog_syntax_order = [
             \ 'baseCluster',
             \ 'statement',
             \ 'assign',
             \ 'attribute',
             \ 'instance',
             \ 'prototype',
             \ 'class',
             \ 'clocking',
             \ 'covergroup',
             \ 'define_OFF',
             \ 'export',
             \ 'expression_OFF',
             \ 'function',
             \ 'interface',
             \ 'module',
             \ 'property',
             \ 'sequence',
             \ 'specify',
             \ 'task',
             \ 'typedef',
             \ ]

" Generate syntax definitions for supported types
for name in s:verilog_syntax_order
    call s:SyntaxCreate(name, g:verilog_syntax)
endfor
" matchgroup play the role of delimiter
syn region verilogExpression matchgroup=verilogOperator start="(" end=")" skip="//.*" transparent contains=verilogDataType,verilogExpression,uvm_class,uvm_type
" end label not highlight
syn region sv_label start=":" end="\v[^;\[\]\(\)\<\>\{\}]$" transparent oneline contains=NONE

if index(s:verilog_syntax_fold, "block_nested") >= 0 || index(s:verilog_syntax_fold, "block_named") >= 0
    if index(s:verilog_syntax_fold, "block_nested") >= 0
        syn region verilogBlock
            \ matchgroup=verilogStatement
            \ start="\<begin\>"
            \ end="\<end\>.*\<begin\>"ms=s-1,me=s-1
            \ fold
            \ transparent
            \ contained
            \ nextgroup=verilogBlockEnd
            \ contains=TOP
        syn region verilogBlockEnd
            \ matchgroup=verilogStatement
            \ start="\<end\>.*\<begin\>"
            \ end="\<end\>\ze.*\(\<begin\>\)\@!"
            \ fold
            \ transparent
            \ contained
            \ contains=TOP
        syn match verilogStatement "\<end\>"
    else "block_named
        syn region verilogBlock
            \ matchgroup=verilogStatement
            \ start="\<begin\>"
            \ end="\<end\>"
            \ transparent
            \ contained
            \ contains=TOP
        syn region verilogBlockNamed
            \ matchgroup=verilogStatement
            \ start="\<begin\>\ze\s*:\s*\z(\w\+\)"
            \ end="\<end\>"
            \ transparent
            \ fold
            \ contained
            \ contains=TOP
        "TODO break up if...else statements
    endif
    syn region verilogBlockContainer
        \ start="\<begin\>"
        \ end="\<end\>"
        \ skip="/[*/].*"
        \ transparent
        \ keepend extend
        \ contains=verilogBlock,verilogBlockNamed,verilogBlockEnd
elseif index(s:verilog_syntax_fold, "block") >= 0 || index(s:verilog_syntax_fold, "all") >= 0
    syn region verilogBlock
        \ matchgroup=verilogStatement
        \ start="\<begin\>"
        \ end="\<end\>"
        \ transparent
        \ fold
else
    syn keyword verilogStatement  begin end
endif

if index(s:verilog_syntax_fold, "define") >= 0 || index(s:verilog_syntax_fold, "all") >= 0
    syn region verilogIfdef
        \ start="`ifn\?def\>"
        \ end="^\s*`els\(e\|if\)\>"ms=s-1,me=s-1
        \ fold transparent
        \ keepend
        \ contained
        \ nextgroup=verilogIfdefElse,verilogIfdefEndif
        \ contains=TOP
    syn region verilogIfdefElse
        \ start="`els\(e\|if\)\>"
        \ end="^\s*`els\(e\|if\)\>"ms=s-1,me=s-1
        \ fold transparent
        \ keepend
        \ contained
        \ nextgroup=verilogIfdefElse,verilogIfdefEndif
        \ contains=TOP
    syn region verilogIfdefEndif
        \ start="`else\>"
        \ end="`endif\>"
        \ fold transparent
        \ keepend
        \ contained
        \ contains=TOP
    syn region verilogIfdefContainer
        \ start="`ifn\?def\>"
        \ end="`endif\>"
        \ skip="/[*/].*"
        \ transparent
        \ keepend extend
        \ contains=verilogIfdef,verilogIfdefElse,verilogIfdefEndif
endif

" Generate syntax definitions for comments after other standard syntax
" definitions to guarantee highest priority
for name in ['comment']
    call s:SyntaxCreate(name, g:verilog_syntax)
endfor

" Generate syntax definitions for custom types last to allow overriding
" standard syntax
if exists('g:verilog_syntax_custom')
    for name in keys(g:verilog_syntax_custom)
        call s:SyntaxCreate(name, g:verilog_syntax_custom)
    endfor
endif

" Special comments: Synopsys directives
syn match   verilogDirective   "//\s*synopsys\>.*$"
syn region  verilogDirective   start="/\*\s*synopsys\>" end="\*/"
syn region  verilogDirective   start="//\s*synopsys \z(\w*\)begin\>" end="//\s*synopsys \z1end\>"

syn match   verilogDirective   "//\s*\$s\>.*$"
syn region  verilogDirective   start="/\*\s*\$s\>" end="\*/"
syn region  verilogDirective   start="//\s*\$s dc_script_begin\>" end="//\s*\$s dc_script_end\>"

"Modify the following as needed.  The trade-off is performance versus
"functionality.
syn sync minlines=50

" Define the default highlighting.
" For version 5.7 and earlier: only when not done already
" For version 5.8 and later: only when an item doesn't have highlighting yet
if version >= 508 || !exists("did_verilog_syn_inits")
   if version < 508
      let did_verilog_syn_inits = 1
      command -nargs=+ HiLink hi link <args>
   else
      command -nargs=+ HiLink hi def link <args>
   endif

  " The default highlighting.
   HiLink verilogConditional     Statement
   HiLink verilogRepeat          Statement
   HiLink verilogString          Constant
   HiLink verilogTodo            Special
   HiLink verilogComment         Comment
   HiLink verilogConstant        Constant
   HiLink verilogLabel           Underlined
   HiLink verilogNumber          Constant
   HiLink verilogOperator        Special
   HiLink verilogPrototype       Statement
   HiLink verilogStatement       Statement
   HiLink verilogGlobal          Identifier
   HiLink verilogDirective       PreProc
   HiLink verilogEscape          Special
   HiLink verilogMethod          Statement
   HiLink verilogTypeDef         Type
   HiLink verilogObject          Identifier

    HiLink verilogDataType         Type
    HiLink uvm_class               Type
    HiLink uvm_data                Identifier
    HiLink uvm_enum                Constant
    HiLink uvm_method              Statement
    HiLink uvm_phase               Statement
    HiLink uvm_seq                 Type
    HiLink uvm_macros              PreProc
    HiLink sv_directive            PreProc
    HiLink uvm_type                Type

   delcommand HiLink
endif

let b:current_syntax = "verilog_systemverilog"

" Restore cpoptions
let &cpoptions=oldcpo

" vim: sts=4 sw=4
