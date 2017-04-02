
{$ifdef TNT_UNICODE}
{$define listview}   // if using unicode, force the use of the TTntListView control (do not change!)
{$else}
   {$ifdef Japanese}
   {.$define listview}   // if not assigned then this demo uses the TZipView component
   {$else}
   {.$define listview}   // <-- non-unicode! if not assigned then this demo uses the TZipView component
   {$endif}
{$endif TNT_UNICODE}



