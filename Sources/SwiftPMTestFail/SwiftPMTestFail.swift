#if SWIFT_PACKAGE
import failingpc
#endif

struct SwiftPMTestFail {
    var text = "Hello, World!"
}

func test() {
  if SQLITE_VERSION == "" {
    print("Success!")
  } else {
    // We won't compile...
    print("Fail!")
  }
}
