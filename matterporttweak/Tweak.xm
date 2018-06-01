

@interface InitialViewController: UIViewController
- (void)onNoti:(NSNotification *)noti;
@end

%hook InitialViewController

- (void)viewDidLoad {
  %orig;
  [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(onNoti:) name:@"B" object:nil];
}


- (void)viewDidAppear:(_Bool)arg1 {
  %orig;
  dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    // if (![self isKindOfClass:[UIAlertController class]]) {
    //   UIAlertController *alertController = ({
    //         UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"BBBBB's info~!" message:@"超级注入已部署" preferredStyle:UIAlertControllerStyleAlert];
    //         [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil]];
    //         alertController;
    //     });
    //     [self presentViewController:alertController animated:YES completion:nil];
    // }
  });
}

%new
- (void)onNoti:(NSNotification *)noti {
    UIAlertController *alertController = ({
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"BBBBB's noti~!" message:[NSString stringWithFormat:@"%@", noti.object] preferredStyle:UIAlertControllerStyleAlert];
        [alertController addAction:[UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDestructive handler:nil]];
        alertController;
    });
    [self presentViewController:alertController animated:YES completion:nil];
}

%end

%hook JobUploader

+ (id)instance {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's JobUploader instance" message:@"~" delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}

- (void)uploadJob:(id)arg1 {
  %orig;
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B" message:[NSString stringWithFormat:@"arg:\n%@", arg1] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
    [alert show];
}
- (void)uploadJob:(id)arg1 toOrg:(id)arg2 completion:(id)arg3 {

  %orig;
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's upload" message:[NSString stringWithFormat:@"arg:\n%@ \nto:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
}

%end

%hook SSZipArchive

+ (_Bool)createZipFileAtPath:(id)arg1 withContentsOfDirectory:(id)arg2 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}


+ (_Bool)createZipFileAtPath:(id)arg1 withContentsOfDirectory:(id)arg2 keepParentDirectory:(_Bool)arg3 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
+ (_Bool)createZipFileAtPath:(id)arg1 withContentsOfDirectory:(id)arg2 keepParentDirectory:(_Bool)arg3 withPassword:(id)arg4 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
+ (_Bool)createZipFileAtPath:(id)arg1 withContentsOfDirectory:(id)arg2 keepParentDirectory:(_Bool)arg3 withPassword:(id)arg4 andProgressHandler:(id)arg5 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
+ (_Bool)createZipFileAtPath:(id)arg1 withContentsOfDirectory:(id)arg2 withPassword:(id)arg3 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
+ (_Bool)createZipFileAtPath:(id)arg1 withFilesAtPaths:(id)arg2 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
+ (_Bool)createZipFileAtPath:(id)arg1 withFilesAtPaths:(id)arg2 withPassword:(id)arg3 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's zip" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}

- (_Bool)writeData:(id)arg1 filename:(id)arg2 withPassword:(id)arg3 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's write" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
- (_Bool)writeFile:(id)arg1 withPassword:(id)arg2 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's write" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}
- (_Bool)writeFileAtPath:(id)arg1 withFileName:(id)arg2 withPassword:(id)arg3 {
  UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B's write" message:[NSString stringWithFormat:@"~PATH~:\n%@ \n~DIR~:\n%@", arg1, arg2] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  [alert show];
  return %orig;
}

%end

// %hook JobManager
//
// - (id)duplicateJob:(id)arg1 {
  // UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"B" message:[NSString stringWithFormat:@"arg:\n%@", arg1] delegate:nil cancelButtonTitle:@"cancel" otherButtonTitles:nil];
  // [alert show];
//   [[NSNotificationCenter defaultCenter] postNotificationName:@"B" object:[NSString stringWithFormat:@"info:\n%@", arg1]];
//   return %orig;
// }
//
// - (void)duplicateJobs:(id)arg1 {
//   [[NSNotificationCenter defaultCenter] postNotificationName:@"B" object:[NSString stringWithFormat:@"info:\n%@", arg1]];
//   return %orig;
// }
//
// %end
