Extension { #name : #RGEnvironment }

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> allClasses [
	| classes |
	
	classes := OrderedCollection new.
	self behaviorsDo:[:class | class isMeta ifFalse:[classes add: class]].
	classes sort:[:a :b | a name < b name ].
	^classes
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> associationsDo: aBlock [

	self bindings do: aBlock
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> at: aSymbol [

	^ self ask behaviorNamed: aSymbol
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> bindings [

	"TODO:"

	| dict |
	
	dict := Dictionary new.
	self globalVariablesDo: [ :each | 
		each name -> each ].
	
	^ dict.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> browse [

	 | clyEnv clyNavEnv browser |

	clyEnv := ClyRing2Environment new.
	clyEnv environment: self.

	clyNavEnv := (ClyNavigationEnvironment over: clyEnv)
		addPlugin: ClyDefaultSystemEnvironmentPlugin new;
	   attachToSystem.

	browser := ClyFullBrowser new 
		navigationEnvironment: clyNavEnv.
	browser addPlugin: ClyStandardBrowserPlugin new.

	^ browser open.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> classNames [
	^ self allClasses collect: #name.
]

{ #category : #'*Calypso-Ring2' }
RGEnvironment >> nonClassNames [

	"TODO:"
	^ #()
]
