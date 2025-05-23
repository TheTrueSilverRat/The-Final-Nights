/// Used to trigger signals and call procs registered for that signal
/// The datum hosting the signal is automatically added as the first argument
/// Returns a bitfield gathered from all registered procs
/// Arguments given here are packaged in a list and given to _SendSignal
#define SEND_SIGNAL(target, sigtype, arguments...) ( !target._listen_lookup?[sigtype] ? NONE : target._SendSignal(sigtype, list(target, ##arguments)) )

#define SEND_GLOBAL_SIGNAL(sigtype, arguments...) ( SEND_SIGNAL(SSdcs, sigtype, ##arguments) )

/// Signifies that this proc is used to handle signals.
/// Every proc you pass to RegisterSignal must have this.
#define SIGNAL_HANDLER SHOULD_NOT_SLEEP(TRUE)

/// Signifies that this proc is used to handle signals, but also sleeps.
/// Do not use this for new work.
#define SIGNAL_HANDLER_DOES_SLEEP

/// A wrapper for _AddElement that allows us to pretend we're using normal named arguments
#define AddElement(arguments...) _AddElement(list(##arguments))
/// A wrapper for _RemoveElement that allows us to pretend we're using normal named arguments
#define RemoveElement(arguments...) _RemoveElement(list(##arguments))

/// A wrapper for _AddComponent that allows us to pretend we're using normal named arguments
#define AddComponent(arguments...) _AddComponent(list(##arguments))

/// A wrapper for _AddComonent that passes in a source.
/// Necessary if dupe_mode is set to COMPONENT_DUPE_SOURCES.
#define AddComponentFrom(source, arguments...) _AddComponent(list(##arguments), source)

/// A wrapper for _LoadComponent that allows us to pretend we're using normal named arguments
#define LoadComponent(arguments...) _LoadComponent(list(##arguments))
